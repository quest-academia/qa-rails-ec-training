class ChangeProductToOrderDetails < ActiveRecord::Migration[6.0]
  def up
    change_column :order_details, :product_id, :bigint, null: true
  end

  def down
    change_column :order_details, :product_id, :bigint, null: false
  end
end
