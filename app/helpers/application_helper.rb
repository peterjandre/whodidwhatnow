module ApplicationHelper

  def random_person
    Person.find(Person.pluck(:id).sample)
  end
end
