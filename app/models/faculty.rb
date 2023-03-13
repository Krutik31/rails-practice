class Faculty < ApplicationRecord
  DEPTS = {
    "Select Department": "nil",
    "Information Technology": "IT",
    "Computer Engineering": "CE"
  }

  DESIGNATIONS = {
    "Select Designation": "nil", 
    "Head of Department": "HOD",
    "Senior Professor": "Sr. Prof.",
    "Assistance Professor": "Ass. Prof.",
    "Professor": "Prof"
  }

  validates :first_name, :last_name, presence: true

  validates :phone_number, length: {is: 10}, numericality: true

  validates :email, presence: true, uniqueness: true

  validate :validate_date_of_birth, if: :check_date?

  validates :department, inclusion: {in: ["IT", "CE"], message: "can't be %{value}."}

  validates :designation, inclusion: {in: ["Ass. Prof.", "Prof"], message: "can't be %{value}."}, exclusion: {in: ["HOD", "Sr. Prof."], message: "%{value} is not allowed."}


  private

  def validate_date_of_birth
    errors.add(:dob, "birthdate can't be in future.")
  end

  def check_date?
    return if (self.dob.blank?)
    (Date.parse(self.dob.to_s) > Date.today)
  end

end
