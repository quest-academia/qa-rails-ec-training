class ProductsController < ApplicationController
  PER = 15
  def index
    # 商品登録しているカテゴリのみ取得
    @categories = Category.joins(:products).where.not("products.category_id" => nil).distinct
    return unless params[:search_button]

    if params[:search_product_name].present?
      @products = Product.includes(:category).search(params[:search_product_name], params[:category_id]).page(params[:page]).per(PER)
      flash.now[:notice] = "商品が見つかりません。" if @products.blank?
    else
      flash.now[:notice] = "商品名を入力してください"
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
