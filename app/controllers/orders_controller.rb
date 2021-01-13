class OrdersController < ApplicationController
  include OrdersHelper

  def show
    @order = Order.find_by(id: params[:id])
  
    cancel_button_indicate

    @total = 0
      @order.order_details.each do | order_detail | 
        @total += order_detail.product.price * order_detail.order_quantity
      end

    if @order.order_details.blank?
      render "blank"
    end
  end
  
end