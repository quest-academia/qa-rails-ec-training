class ProductsController < ApplicationController
  PER = 15
  
  def index
    # 商品登録しているカテゴリのみ取得
    @categories = Category.joins(:products).where("products.category_id IS NOT NULL").distinct
    
    if params[:search].present?
      @products = Product.search(params[:search], params[:id].to_i).page(params[:page]).per(PER)
      flash.now[:notice] = "商品が見つかりません。" if @products.blank?
    end
  end
end
