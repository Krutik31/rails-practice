class OrdersController < ApplicationController
  def index
    @orders = Order.all_orders
  end

  def show
    @order = Order.find(params[:id])
    @item = Item.unscoped.find(@order.item_id)
    @customer = Customer.find(@order.customer_id)
  end

  def new
    @order = Order.new
    @itemid = params[:item_id]
    @customers = Customer.all
  end

  def create
    item = Item.unscoped.find(order_params[:item_id])
    @order = item.orders.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @order = Order.find(params[:id])
    @itemid = Item.unscoped.find(@order.item_id).id
    @customers = Customer.all
  end

  def update
    item = Item.unscoped.find(order_params[:item_id])
    @order = item.orders.find(params[:id])

    if @order.update(order_params)
      redirect_to orders_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  def filter_orders
    case params[:task]
    when '0'
      @orders = Order.all_orders
    when '1'
      @orders = Order.all_orders.filter_order_status('booked')
    when '2'
      @orders = Order.all_orders.filter_order_status('cancelled')
    when '3'
      @orders = Order.all_orders.where('total_amount > 25000')
    when '4'
      @orders = Order.all_orders.where('total_amount < 25000')
    end
    render :index
  end

  def search
    item = Item.unscoped.find_by(title: params[:pname])
    return if item.nil?

    @orders = item.orders
    render :index
  end

  def orders_by_product
    @item = Item.unscoped.find(params[:item_id])
    @orders = Order.where(item_id: params[:item_id])
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :order_status, :item_id, :customer_id)
  end
end
