class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :purchase_price, null: false
      t.integer :purchase_quanity, null: false
      t.string :purchase_company, null: false
      t.datetime :order_date
      t.datetime :purchase_date
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
