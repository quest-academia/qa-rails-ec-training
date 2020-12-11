class SaleStatus < ApplicationRecord
  has_many :products
  
  validates :sale_status_name, presence: true
end
