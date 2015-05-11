class AddPersonIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :person_id, :integer
  end
end
