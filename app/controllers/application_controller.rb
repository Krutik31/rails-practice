class ApplicationController < ActionController::Base
  $callback = {}
  def create_callback_hash(method)
    if %w[update destroy create].any? { |i| i == $callback.keys.last }
      $callback[method] = []
    else
      $callback = { method => [] }
    end
  end
end
