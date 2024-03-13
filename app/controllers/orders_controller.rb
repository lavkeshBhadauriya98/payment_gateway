class OrdersController < ApplicationController

        def create_order
          @order = Razorpay::Order.create(amount: params[:amount], currency: params[:currency], receipt: params[:receipt])
          render json: { order_id: @order.id }
        end

        # def payments
        #   @order = Order.find(params[:id])
        #   @payments = order.payments

        #   render json: {payments: payments}, status: :ok
  
        # rescue ActiveRecord::RecordNotFound
        #   render json: {error: "Order not found"}, status:   :not_found
        # end

        # def show
        #   @order = Razorpay::Order.all
        # end
end      
