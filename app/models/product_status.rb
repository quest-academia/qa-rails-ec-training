class ProductStatus < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :product_status_name, presence: true
end
