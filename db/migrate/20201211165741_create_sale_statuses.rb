class CreateSaleStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_statuses do |t|
      t.string :sale_status_name, null: false

      t.timestamps
    end
  end
end
