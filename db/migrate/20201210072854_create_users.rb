class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.integer :zipcode
      t.string :prefecture
      t.string :municipality
      t.string :address
      t.string :apartments
      t.string :email
      t.string :phone_number
      t.references :user_classification, null: false, foreign_key: true
      t.string :company_name
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
