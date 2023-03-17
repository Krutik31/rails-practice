class ApplicationController < ActionController::Base
  $callback = {}
  def create_callback_hash
    if %w[update destroy create].any? { |i| i == $callback.keys.last }
      $callback[action_name] = []
    else
      $callback = { action_name => [] }
    end
  end
end
