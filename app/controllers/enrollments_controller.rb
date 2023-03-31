class EnrollmentsController < ApplicationController
  before_action :login_checkup

  def index
    @enrolled_events = Enrollment.where(user_id: session[:current_user_id], created: false).pluck(:event_id)
    @events = Event.find(Enrollment.where(created: true).where.not(user_id: session[:current_user_id]).pluck(:event_id))
  end

  def create
    @enrollment = Enrollment.new(event_id: params[:eventid], user_id: session[:current_user_id],
                                 created: false)
    if @enrollment.save
      flash[:notice] = 'You have successfully enrolled.'
      redirect_to enrollments_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def discard
    @enrollment = Enrollment.find_by(event_id: params[:eventid], user_id: session[:current_user_id],
                                     created: false)
    @enrollment.destroy

    redirect_to profiles_path
  end

  private

  def login_checkup
    return if logged_in?

    flash[:notice] = 'You have to first login.'
    redirect_to users_path
  end
end
