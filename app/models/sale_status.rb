class SaleStatus < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :sale_status_name, presence: true
end
