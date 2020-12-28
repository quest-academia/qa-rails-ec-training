class ShipmentStatus < ApplicationRecord
  has_many :order_details
end
