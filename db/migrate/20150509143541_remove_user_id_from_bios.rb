class RemoveUserIdFromBios < ActiveRecord::Migration
  def change
    remove_column :bios, :user_id, :integer
  end
end
