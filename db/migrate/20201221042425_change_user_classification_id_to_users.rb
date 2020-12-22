class ChangeUserClassificationIdToUsers < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :user_classification_id, :bigint, null: true
  end
  
  def down
    change_column :users, :user_classification_id, :bigint, null: false
  end
end
