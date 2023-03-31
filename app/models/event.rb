class Event < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  belongs_to :category
  has_many :comments
end
