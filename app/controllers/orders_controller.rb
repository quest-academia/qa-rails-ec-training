class OrdersController < ApplicationController
  include OrdersHelper
  before_action :logged_in_user, only: [:show, :destroy]
  before_action :correct_user, only: [:show, :destroy]

  def show
    @order = current_user.orders.find_by(id: params[:id])
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to order_path
  end
  
end
