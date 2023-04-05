class ProfilesController < ApplicationController
  before_action :fetch_profile

  def index
    @events = current_user.enrollments.has_not_ownership.extract_associated(:event)
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

  def fetch_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :phonenumber)
  end
end
