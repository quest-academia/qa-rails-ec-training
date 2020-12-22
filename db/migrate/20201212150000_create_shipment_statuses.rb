class CreateShipmentStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipment_statuses do |t|
      t.string :shipment_status_name

      t.timestamps
    end
  end
end
