class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :customers, through: :orders

  validates :first_name, :last_name, :phone_number, presence: true

  validates :email, presence: true, uniqueness: true
end
