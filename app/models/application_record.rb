class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def add_callback(callback_name, msg)
    return if $callback[$callback.keys.last].include?({ callback_name => msg })

    $callback[$callback.keys.last].append({ callback_name => msg })
  end
end
