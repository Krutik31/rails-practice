class UsersController < ApplicationController
  http_basic_authenticate_with name: 'user', password: '123'

  def index; end

  def create
    @user = User.where(username: params[:username]).where(password: params[:password]).first
    if @user
      session[:current_user_id] = @user[:id]
      flash[:notice] = 'You have successfully logged in.'
      cookies[:user_name] = @user[:username]
      redirect_to cars_path
    else
      flash[:notice] = 'Invalid username & password.'
      redirect_to users_path
    end
  end

  def destroy
    session.delete(:current_user_id)
    flash[:notice] = 'You have successfully logged out.'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
