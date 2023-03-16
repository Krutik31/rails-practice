module Messageable
  def display_after_initialize_message
    add_callback(:after_initialized, "Message from 'after_initialized' callback.")
  end

  def display_after_find_message
    add_callback(:after_find, "Message from 'after_find' callback.")
  end

  def display_before_save_message
    add_callback(:before_save, "Message from 'before_save' callback.")
  end

  def display_after_save_message
    add_callback(:after_save, "Message from 'after_save' callback.")
  end

  def display_around_save_message
    add_callback(:around_save, "Message from 'around_save::before_yield' callback.")
    yield
    add_callback(:around_save, "Message from 'around_save::after_yield' callback.")
  end

  def display_before_create_message
    add_callback(:before_create, "Message from 'before_create' callback.")
  end

  def display_after_create_message
    add_callback(:after_create, "Message from 'after_create' callback.")
  end

  def display_around_create_message
    add_callback(:around_create, "Message from 'around_create::before_yield' callback.")
    yield
    add_callback(:around_create, "Message from 'around_create::after_yield' callback.")
  end

  def display_before_update_message
    add_callback(:before_update, "Message from 'before_update' callback.")
  end

  def display_after_update_message
    add_callback(:after_update, "Message from 'after_update' callback.")
  end

  def display_around_update_message
    add_callback(:around_update, "Message from 'around_update::before_yield' callback.")
    yield
    add_callback(:around_update, "Message from 'around_update::after_yield' callback.")
  end

  def display_before_destroy_message
    add_callback(:before_destroy, "Message from 'before_destroy' callback.")
  end

  def display_after_destroy_message
    add_callback(:after_destroy, "Message from 'after_destroy' callback.")
  end

  def display_around_destroy_message
    add_callback(:around_destroy, "Message from 'around_destroy::before_yield' callback.")
    yield
    add_callback(:around_destroy, "Message from 'around_destroy::after_yield' callback.")
  end

  def display_after_commit_message
    add_callback(:after_commit, "Message from 'after_commit' callback.")
  end

  def display_after_update_commit_message
    add_callback(:after_update_commit, "Message from 'after_update_commit' callback.")
  end

  def display_after_destroy_commit_message
    add_callback(:after_destroy_commit, "Message from 'after_destroy_commit' callback.")
  end

  def add_prefix_to_email
    self.email = "ror_demo_#{email}"
  end
end
