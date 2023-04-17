class Item < ApplicationRecord
  has_many :orders, -> { unscoped }
  has_many :customers, through: :orders

  validates :title, :description, :price, :capacity, presence: true

  validates :product_status, inclusion: { in: [0, 1, 2], message: 'Invalid.' }

  default_scope { where(is_active: true) }

  enum :status, ['In stock', 'Out of stock', 'Coming soon']
end
