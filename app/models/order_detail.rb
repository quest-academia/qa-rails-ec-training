class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :shipment_status
  belongs_to :product, optional: true

  validates :order_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
