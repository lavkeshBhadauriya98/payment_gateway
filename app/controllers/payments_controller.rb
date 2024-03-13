class PaymentsController < ApplicationController
    require 'razorpay'  
    skip_before_action :verify_authenticity_token

    before_action :set_razorpay_order, only: [:fetch_order]
    def fetch_order 
        if @order.present?
            render json: {success: true, order: @order.id}, status: :ok
        else
            render json: {success: false, message: "order not found"}, status: :not_found
        end
    end
    
    def capture_payment
        byebug
        payment_id = params[:payment_id]
        amount = params[:amount]
        if payment_id.blank?
          render json: { error: 'Payment ID and Amount are required' }, status: :bad_request
          return
        end

        begin
            @payment = Razorpay::Payment.fetch(payment_id).capture({amount: amount})
            render json: { success: true, payment: @payment }
        rescue => e
            render json: { success: false, error: e.message }
        end
        
      end
    private
    def set_razorpay_order
        begin
            @order = Razorpay::Order.fetch(params[:id])
        rescue Razorpay::Error => e
        Rails.logger.error "Razorpay Error: #{e.message}"
        @order = nil
        end
    end
end
