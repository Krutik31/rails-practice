class EventsController < ApplicationController
  before_action :login_checkup, except: %i[destroy]
  before_action :fetch_event, only: %i[show edit update destroy]
  before_action :all_events, only: %i[index search]
  before_action :fetch_category, only: %i[new edit index search]

  def index; end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
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
    @events = @events.select { |e| e.category_id == params[:category_id].to_i }
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

  def fetch_event
    @event = current_user.events.find(params[:id])
  end

  def fetch_category
    @categories = Category.all
  end

  def all_events
    @events = current_user.enrollments.has_ownership.extract_associated(:event)
  end

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :category_id)
  end
end
