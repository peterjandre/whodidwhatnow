module ApplicationHelper

  def random_person
    if current_user.present?
      @played_people = current_user.answers.pluck(:person_id)
      @game_people = Person.ready_for_game.pluck(:id)
      @available_people = @game_people - @played_people
      if @available_people.empty?
        flash[:alert] = "You have played all the current people. Write more fake bios to add more questions to the game."
        root_path
      else
        @id = @available_people.first
        Person.find_by_id(@id)
      end
    else
      Person.first
    end
  end

end
