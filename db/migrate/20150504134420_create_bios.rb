class CreateBios < ActiveRecord::Migration
  def change
    create_table :bios do |t|
      t.string :text
      t.boolean :real

      t.timestamps null: false
    end
  end
end
