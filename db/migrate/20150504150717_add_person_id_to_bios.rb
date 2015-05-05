class AddPersonIdToBios < ActiveRecord::Migration
  def change
    add_column :bios, :person_id, :integer
  end
end
