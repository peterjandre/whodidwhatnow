class AddQuestionIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :question_id, :integer
  end
end
