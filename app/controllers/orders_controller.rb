class OrdersController < ApplicationController
  include OrdersHelper

  def show
    @order = Order.find_by(id: params[:id])
  end
  
  def create
    unless session[:cart].present?
      redirect_to carts_show_path
    end
    ApplicationRecord.transaction do
      if order = Order.create!(user_id: current_user.id, order_date: Time.current)
        session[:cart].each do |cart|
          order.order_details.create!(
            product_id: cart["product_id"],
            shipment_status_id: 2,
            order_detail_number: sprintf("%04d", OrderDetail.count + 1),
            order_quantity: cart["quantity"],
            shipment_date: Time.current,
          )
        end
        # 注文完了後、カートを空にする
        session[:cart] = nil
      end
    end
    redirect_to purchase_completed_path
  rescue
    flash[:notice] = "エラーが発生しました"
    redirect_to carts_show_path
  end
end
