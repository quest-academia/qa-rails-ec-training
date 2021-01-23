class RemoveProductFromOrderDetails < ActiveRecord::Migration[6.0]
  def change
    remove_reference :order_details, :product, null: false, foreign_key: true
  end
end
