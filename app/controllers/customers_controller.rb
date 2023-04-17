class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order(id: :asc)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    redirect_to customers_path
  end

  def task
    case params[:id]
    when '1'
      @customers = Customer.joins(:orders).group(:id)
                           .order('SUM(quantity) DESC').limit(3)
    when '2'
      @customers = Customer.joins(:orders).group(:id)
                           .order('SUM(total_amount) DESC').limit(3)
    when '3'
      @customers = Customer.joins(:orders).where("orders.order_status = 'booked'")
                           .order('COUNT(customers.id) DESC').group('customers.id').limit(5)
    when '4'
      @customers = Customer.joins(:orders).where("orders.order_status = 'cancelled'")
                           .order('COUNT(customers.id) DESC').group('customers.id').limit(5)
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_number)
  end
end
