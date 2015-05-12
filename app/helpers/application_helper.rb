module ApplicationHelper

  def random_person
    Person.find(Person.pluck(:id).sample)
  end

  def next_person
    if current_user.present?
      @user_id = current_user.id
      @unanswered_question = Question.where(bio_id: nil, user_id: @user_id)
      @unanswered_question_id = @unanswered_question.pluck(:id)

      if @unanswered_question.present?
        "/users/#{@user_id}/questions/#{@unanswered_question_id[0]}"
      else
        flash[:alert] = "There are no more questions available to you."
        root_path
      end
    else
      return false
    end
  end

end
