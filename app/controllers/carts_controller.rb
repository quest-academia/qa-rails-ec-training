class CartsController < ApplicationController
  before_action :logged_in_user

  def show
    return if session[:cart].blank?

    # view用：カート情報を配列に格納
    @cart = []
    session[:cart].each do |cart|
      product = Product.find(cart["product_id"])
      category_name = product.category.category_name
      subtotal = product.price * cart["quantity"].to_i
      @cart.push([product.product_name, category_name, product.price, cart["quantity"].to_i, subtotal])
    end
    # カート内の合計を計算
    @total_amount = total_amount(@cart)
  end

  def add_cart # rubocop:disable Metrics/AbcSize
    if session[:cart].blank?
      session[:cart] = [{ product_id: params[:product_id], quantity: params[:quantity].to_i }]
    else
      # カート内に既にある商品（数量追加）
      if index = session[:cart].pluck("product_id").index(params[:product_id]) # rubocop:disable Lint/AssignmentInCondition
        session[:cart][index]["quantity"] += params[:quantity].to_i
      else
        session[:cart].push({ product_id: params[:product_id], quantity: params[:quantity].to_i })
      end
    end
    redirect_to carts_show_path
  end

  def change_quantity
    session[:cart][params[:array_index].to_i]["quantity"] = params[:quantity]
    redirect_to carts_show_path
  end

  def destroy
    session[:cart].delete_at(params[:array_index].to_i)
    redirect_to carts_show_path
  end

  def total_amount(cart)
    cart.sum{_1[4]}
  end
end
