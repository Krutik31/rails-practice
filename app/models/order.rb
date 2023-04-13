class Order < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  before_save :total_price

  scope :all_orders, -> { all.order(id: :asc) }

  scope :filter_order_status, ->(status) { where(order_status: status) }

  FILTERS = {
    "All Orders": '0',
    "has status 'booked'": '1',
    "has status 'cancelled'": '2',
    "has total amount > 25000": '3',
    "has total amount < 25000": '4'
  }.freeze

  private

  def total_price
    item = Item.unscoped.find(item_id)
    self.total_amount = quantity * item.price
  end
end
