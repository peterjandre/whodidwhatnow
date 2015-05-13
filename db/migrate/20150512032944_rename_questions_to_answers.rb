class RenameQuestionsToAnswers < ActiveRecord::Migration
  def change
    rename_table :questions, :answers
  end
end
