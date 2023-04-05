class EnrollmentsController < ApplicationController
  before_action :login_checkup

  def index
    @enrolled_event_ids = current_user.enrollments.has_not_ownership.pluck(:event_id)
    @events = Enrollment.has_ownership.where.not(user_id: 1).extract_associated(:event)
  end

  def create
    @enrollment = current_user.enrollments.new(event_id: params[:eventid], is_owner: false)
    if @enrollment.save
      flash[:notice] = 'You have successfully enrolled.'
      redirect_to enrollments_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def discard
    @enrollment = current_user.enrollments.has_not_ownership.find_by(event_id: params[:eventid])
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
