class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :sale_status, optional: true
  belongs_to :product_status, optional: true
  has_many :purchases, dependent: :destroy
  has_many :order_details

  validates :product_name, :price, presence: true
  
  # 商品検索
  def self.search(search, id)
    @category = where(category_id: id)
    @category.where('product_name LIKE ?', "%#{search}%")
  end
end
