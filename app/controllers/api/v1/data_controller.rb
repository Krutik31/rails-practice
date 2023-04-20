module Api
  module V1
    class DataController < ApplicationController
      before_action :response_in_json

      def index
        @customers = Customer.all.order(id: :asc)
        @items = Item.unscoped.all.order(id: :asc)
        @orders = Order.all.order(id: :asc)
        render json: [@customers, @items, @orders]
      end

      def customers_data
        @customers = Customer.all.order(id: :asc)
        render json: [@customers]
      end

      def items_data
        @items = Item.unscoped.all.order(id: :asc)
        render json: [@items]
      end

      def orders_data
        @orders = Order.all.order(id: :asc)
        render json: [@orders]
      end

      private

      def response_in_json
        respond_to :json
      end
    end
  end
end
