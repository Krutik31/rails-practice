class UsersController < ApplicationController
  # http_basic_authenticate_with name: 'user', password: '123'

  def index
    # return unless logged_in?

    # flash[:notice] = 'You are already logged in.'
    # redirect_to cars_path
  end

  def create
    @user = User.where(user_params).first
    if @user
      session[:current_user_id] = @user[:id]
      flash[:notice] = 'You have successfully logged in.'
      cookies[:user_name] = @user[:username]
    else
      flash[:notice] = 'Invalid username & password.'
    end
    redirect_to users_path
  end

  def logout
    session.delete(:current_user_id)
    cookies.delete(:user_name)
    flash[:notice] = 'You have successfully logged out.'
    redirect_to users_path
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
