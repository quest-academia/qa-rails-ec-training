class ProductStatus < ApplicationRecord
  has_many :products

  validates :product_status_name, presence: true
end
