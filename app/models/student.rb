class Student < ApplicationRecord
  validates :first_name, :last_name, presence: true

  validate :validate_date_of_birth, if: :check_date?

  validates :department, inclusion: { in: %w[IT CE], message: "can't be %<value>." }

  validates :terms_of_usage, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }

  DEPTS = { 'Select Department': 'nil', 'Information Technology': 'IT', 'Computer Engineering': 'CE' }.freeze

  private

  def validate_date_of_birth
    errors.add(:dob, "birthdate can't be in future.")
  end

  def check_date?
    return if dob.blank?

    Date.parse(dob.to_s) > Date.today
  end
end
