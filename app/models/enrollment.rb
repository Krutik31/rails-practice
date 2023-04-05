class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  scope :has_ownership, -> { where(is_owner: true) }
  scope :has_not_ownership, -> { where(is_owner: false) }
end
