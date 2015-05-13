module ApplicationHelper

  def random_person
    if current_user.present?
      @played_people = current_user.answers.pluck(:person_id)
      @game_people = Person.ready_for_game.pluck(:id)
      @available_people = @game_people - @played_people
      if @available_people.empty?
        flash[:alert] = "You have played all the current people. Check back soon."
        root_path
      else
        @id = @available_people.sample
        Person.find_by_id(@id)
      end
    else
      root_path
    end
  end

end
