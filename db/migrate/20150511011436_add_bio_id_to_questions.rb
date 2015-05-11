class AddBioIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :bio_id, :integer
  end
end
