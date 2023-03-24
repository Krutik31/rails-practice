class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found

  helper_method :current_user, :logged_in?

  $callback = {}
  def create_callback_hash
    if %w[update destroy create].any? { |i| i == $callback.keys.last }
      $callback[action_name] = []
    else
      $callback = { action_name => [] }
    end
  end

  def current_user
    @current_user = User.where(id: session[:current_user_id]).first
  end

  def logged_in?
    current_user != nil
  end

  private

  def page_not_found
    render file: 'public/404.html', status: 404
  end
end
