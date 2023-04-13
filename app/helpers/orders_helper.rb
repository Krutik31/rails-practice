module OrdersHelper
  def item_title(order_item_id)
    Item.unscoped.find_by(id: order_item_id).title
  end
end
