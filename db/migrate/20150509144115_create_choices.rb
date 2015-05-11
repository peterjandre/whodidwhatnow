class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :user_id
      t.integer :bio_id

      t.timestamps null: false
    end
  end
end
