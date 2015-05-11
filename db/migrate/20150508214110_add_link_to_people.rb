class AddLinkToPeople < ActiveRecord::Migration
  def change
    add_column :people, :link, :string
  end
end
