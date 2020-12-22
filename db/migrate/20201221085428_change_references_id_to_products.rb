class ChangeReferencesIdToProducts < ActiveRecord::Migration[6.0]
  def up
    change_column :products, :category_id, :bigint, null: true
    change_column :products, :sale_status_id, :bigint, null: true
    change_column :products, :product_status_id, :bigint, null: true
  end
  
  def down
    change_column :products, :category_id, :bigint, null: false
    change_column :products, :sale_status_id, :bigint, null: false
    change_column :products, :product_status_id, :bigint, null: false
  end
end
