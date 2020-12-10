class CreateUsersClassicications < ActiveRecord::Migration[6.0]
  def change
    create_table :users_classicications do |t|
      t.string :user_classification_name

      t.timestamps
    end
  end
end
