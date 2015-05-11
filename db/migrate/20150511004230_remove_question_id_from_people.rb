class RemoveQuestionIdFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :question_id, :integer
  end
end
