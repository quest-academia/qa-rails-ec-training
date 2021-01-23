class AddProductToOrderDetails < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_details, :product, foreign_key: true, optional: true
  end
end
