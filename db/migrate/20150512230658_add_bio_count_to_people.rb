class AddBioCountToPeople < ActiveRecord::Migration
  def change
    add_column :people, :bio_count, :integer, default: 1
  end
end
