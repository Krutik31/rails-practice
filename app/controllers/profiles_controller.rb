class ProfilesController < ApplicationController
  before_action :find_profile

  def index
    @events = Event.find(Enrollment.where(user_id: session[:current_user_id], created: false).pluck(:event_id))
    @address = Address.find_by(user_id: session[:current_user_id])
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_profile
    @profile = Profile.where(user_id: session[:current_user_id]).first
  end

  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :phonenumber)
  end
end
