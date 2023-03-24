class Car < ApplicationRecord
  validates :car_name, :price, presence: true
end
