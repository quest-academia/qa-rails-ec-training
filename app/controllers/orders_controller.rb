class OrdersController < ApplicationController
  include OrdersHelper

  def show
    @order = Order.find_by(id: params[:id])

    @total = @order.order_details.sum do | order_detail | 
        order_detail.product.price * order_detail.order_quantity
      end

    if @order.order_details.blank?
      render "_blank"
    end
  end
  
end