module Api
  module V1
    class DataController < ApplicationController
      def index
        @customers = Customer.all.order(id: :asc)
        @items = Item.unscoped.all.order(id: :asc)
        @orders = Order.all.order(id: :asc)
        respond_to :json
        render json: [@customers, @items, @orders]
      end

      def customers_data
        @customers = Customer.all.order(id: :asc)
        respond_to :json
        render json: [@customers]
      end

      def items_data
        @items = Item.unscoped.all.order(id: :asc)
        respond_to :json
        render json: [@items]
      end

      def orders_data
        @orders = Order.all.order(id: :asc)
        respond_to :json
        render json: [@orders]
      end
    end
  end
end
