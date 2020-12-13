class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.integer :price, null: false
      t.string :description
      t.boolean :delete_flag, null: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :sale_status, null: false, foreign_key: true
      t.references :product_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
