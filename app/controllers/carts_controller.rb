class CartsController < ApplicationController
  def show
    # view用：カート情報を配列に格納
    if session[:cart].present?
      @cart = Array.new
      session[:cart].each do |cart|
        product = Product.find(cart["product_id"])
        category_name = Category.find(product.category_id).category_name
        subtotal = product.price * cart["quantity"].to_i
        @cart.push([product.product_name, category_name, product.price, cart["quantity"].to_i, subtotal])
      end
      # カート内の合計を計算
      total_amount
    end
  end

  def add_cart
    if session[:cart].blank?
      session[:cart] = [{product_id: params[:product_id], quantity: params[:quantity].to_i}]
    else
      # カート内に既にある商品（数量追加）
      match_flag = false
      session[:cart].map {|cart| (cart["quantity"] += params[:quantity].to_i) && (match_flag = true) if cart["product_id"] == params[:product_id] }
      unless match_flag
        session[:cart].push({product_id: params[:product_id], quantity: params[:quantity].to_i})
      end
    end
    redirect_to carts_show_path
  end

  def change_quantity
    session[:cart][params[:array_index].to_i - 1]["quantity"] = params[:quantity]
    redirect_to carts_show_path
  end

  def destroy
    session[:cart].delete_at(params[:array_index].to_i - 1)
    redirect_to carts_show_path
  end

  def total_amount
    @total_amount = 0
    @cart.each do |cart_item|
      @total_amount += cart_item[4].to_i
    end
  end
end
