class Event < ApplicationRecord
  attr_accessor :user

  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  belongs_to :category
  has_many :comments
  after_save :add_enrollment

  def add_enrollment
    user.enrollments.create(event_id: id, is_owner: true)
  end
end
