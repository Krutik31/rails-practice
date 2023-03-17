class Student < ApplicationRecord
  include Messageable

  validates :first_name, :last_name, presence: true

  validate :validate_date_of_birth, if: :check_date?

  validates :department, inclusion: { in: %w[IT CE], message: "can't be %<value>." }

  validates :terms_of_usage, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }

  after_initialize :display_after_initialize_message

  after_find :display_after_find_message

  before_save :display_before_save_message, :add_prefix_to_email
  after_save :display_after_save_message
  around_save :display_around_save_message

  before_create :display_before_create_message
  after_create :display_after_create_message
  around_create :display_around_create_message

  before_update :display_before_update_message, :change_student_counter
  after_update :display_after_update_message
  around_update :display_around_update_message

  before_destroy :display_before_destroy_message
  after_destroy :display_after_destroy_message, if: :check_deleted?
  around_destroy :display_around_destroy_message

  before_validation :set_default_date, if: :check_date_is_empty?

  after_validation :validate_email, on: :create

  after_commit :display_after_commit_message, on: %i[create update destroy]
  after_create_commit :student_count
  after_update_commit :student_update_count_message
  after_destroy_commit :remove_student_message

  DEPTS = { 'Select Department': 'nil', 'Information Technology': 'IT', 'Computer Engineering': 'CE' }.freeze

  private

  def set_default_date
    self.dob = Date.parse('2001-01-01')
    add_callback(:before_validation, 'Setting default birthdate: 01-01-2001.')
  end

  def check_date_is_empty?
    dob.blank?
  end

  def validate_email
    add_callback(:after_validation, 'Email validated.')
  end

  def check_deleted?
    !Student.exists?(id)
  end

  def student_count
    counter = Student.count
    add_callback(:after_create_commit, "Total students: #{counter}.")
  end

  def change_student_counter
    self.update_counter = update_counter + 1
  end

  def student_update_count_message
    add_callback(:after_update_commit, "Updated #{update_counter} times.")
  end

  def remove_student_message
    add_callback(:after_destroy_commit, "Student #{first_name} #{last_name} is removed from system.")
  end

  def validate_date_of_birth
    errors.add(:dob, "birthdate can't be in future.")
  end

  def check_date?
    return if dob.blank?

    Date.parse(dob.to_s) > Date.today
  end
end
