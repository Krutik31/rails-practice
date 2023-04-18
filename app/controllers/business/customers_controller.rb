module Business
  class CustomersController < ApplicationController
    def index
      @customers = Customer.all.order(id: :asc)
    end

    def preview
      @customer = Customer.find(params[:customer_id])
    end

    def new
      @customer = Customer.new
    end

    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        redirect_to business_customers_path
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
        redirect_to business_customers_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def delete_customer
      @customer = Customer.find(params[:customer_id])
      @customer.destroy

      redirect_to business_customers_path
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

    def search
      @customers = Customer.where("first_name LIKE '%#{params[:cname]}%'")
      render :index
    end

    private

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone_number)
    end
  end
end
