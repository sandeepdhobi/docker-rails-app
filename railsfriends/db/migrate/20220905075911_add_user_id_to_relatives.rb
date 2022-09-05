class AddUserIdToRelatives < ActiveRecord::Migration[6.0]
  def change
    add_column :relatives, :user_id, :integer
    add_index :relatives, :user_id
  end
end
