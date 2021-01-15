class OrdersController < ApplicationController
  include OrdersHelper

  def show
    @order = Order.find_by(id: params[:id])
  end
  
end