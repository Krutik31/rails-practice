class Author < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :email, presence: true, format:{with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true}

  validate :validate_date_of_birth, if: :check_date?

  private

  def validate_date_of_birth
    self.errors.add(:date_of_birth, "Date should be less than today's date and greater than 01-01-1950.")
  end

  def check_date?
    return if (self.date_of_birth.blank?)
    (Date.parse(self.date_of_birth.to_s) >= Date.today) || (Date.parse(self.date_of_birth.to_s) <= Date.parse("01-01-1950"))
  end

  has_many :books, dependent: :destroy

end
