class Faculty < ApplicationRecord
  include Messageable

  validates :first_name, :last_name, :dob, presence: true

  validates :phone_number, length: { is: 10 }, numericality: true

  validates :email, presence: true, uniqueness: true

  validate :validate_date_of_birth, if: :check_date?

  validates :department, inclusion: { in: %w[IT CE], message: "can't be %<value>s." }

  validates :designation, inclusion: { in: ['Ass. Prof.', 'Prof'], message: "can't be %<value>s." },
                          exclusion: { in: ['HOD', 'Sr. Prof.'], message: '%<value>s is not allowed.' }

  after_initialize :display_after_initialize_message

  after_find :display_after_find_message

  before_save :display_before_save_message, :add_prefix_to_email
  after_save :display_after_save_message
  around_save :display_around_save_message

  before_create :display_before_create_message
  after_create :display_after_create_message
  around_create :display_around_create_message

  before_update :display_before_update_message, :change_faculty_counter
  after_update :display_after_update_message
  around_update :display_around_update_message

  before_destroy :display_before_destroy_message
  after_destroy :display_after_destroy_message
  around_destroy :display_around_destroy_message

  after_validation :age_calculation

  after_commit :display_after_commit_message, on: %i[create update destroy]
  after_create_commit :faculty_count
  after_update_commit :faculty_update_count_message
  after_destroy_commit :remove_faculty_message

  DEPTS = {
    "Select Department": 'nil',
    "Information Technology": 'IT',
    "Computer Engineering": 'CE'
  }.freeze

  DESIGNATIONS = {
    "Select Designation": 'nil',
    "Head of Department": 'HOD',
    "Senior Professor": 'Sr. Prof.',
    "Assistance Professor": 'Ass. Prof.',
    "Professor": 'Prof'
  }.freeze

  private

  def age_calculation
    self.age = Date.today.year - dob.year
    add_callback(:after_validation, "Faculty's age is #{age}.")
  end

  def faculty_count
    counter = Faculty.count
    add_callback(:after_create_commit, "Total faculties: #{counter}.")
  end

  def change_faculty_counter
    self.update_counter = update_counter + 1
  end

  def faculty_update_count_message
    add_callback(:after_update_commit, "Updated #{update_counter} times.")
  end

  def remove_faculty_message
    add_callback(:after_destroy_commit, "Faculty #{first_name} #{last_name} is removed from system.")
  end

  def validate_date_of_birth
    errors.add(:dob, "birthdate can't be in future.")
  end

  def check_date?
    return if dob.blank?

    Date.parse(dob.to_s) > Date.today
  end
end
