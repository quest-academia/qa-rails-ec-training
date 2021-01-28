class OrdersController < ApplicationController
  include OrdersHelper
  before_action :logged_in_user
  before_action :correct_users_order

  def show
    @order = current_user.orders.find_by(id: params[:id])
  end

  def create
    if session[:cart].blank?
      redirect_to carts_show_path
    end
    ApplicationRecord.transaction do
      order = current_user.orders.create!(order_date: Time.current)
      session[:cart].each do |cart|
        order.order_details.create!(
          product_id: cart["product_id"],
          shipment_status_id: 2,
          order_detail_number: "%04d" % (OrderDetail.count + 1),
          order_quantity: cart["quantity"],
          shipment_date: Time.current,
        )
      end
      # 注文完了後、カートを空にする
      session[:cart].clear
    end
    redirect_to purchase_completed_path
  end

  # 注文はログインユーザーのものかどうか確認
  def correct_users_order
    unless current_user.id == Order.find(params[:id]).user_id
      flash[:danger] = "他人の情報にアクセスすることはできません。"
      redirect_to root_url
    end
  end
end
