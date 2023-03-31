class EventsController < ApplicationController
  before_action :login_checkup, except: %i[destroy]
  before_action :find_event, only: %i[show edit update destroy]
  before_action :all_events, only: %i[index search]
  before_action :find_category, only: %i[new edit index search]

  def index; end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      Enrollment.create(event_id: @event.id, user_id: session[:current_user_id], created: true)
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    @events = @events.where(category_id: params[:category_id])
    render :index
  end

  def destroy
    @event.destroy

    redirect_to events_path
  end

  private

  def login_checkup
    return if logged_in?

    flash[:notice] = 'You have to first login.'
    redirect_to users_path
  end

  def find_event
    @event = Event.find_by(id: Enrollment.where(user_id: session[:current_user_id],
                                                event_id: params[:id]).pluck(:event_id))
  end

  def find_category
    @categories = Category.all
  end

  def all_events
    @events = Event.where(id: Enrollment.where(user_id: session[:current_user_id],
                                               created: true).pluck(:event_id)).order(id: :desc)
  end

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :category_id)
  end
end
