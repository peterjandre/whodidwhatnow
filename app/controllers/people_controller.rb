class PeopleController < ApplicationController
  def show
    @person = Person.find_by_id(params[:id])
    @bios = @person.bios.sample(5)
  end

  def index
    @people = Person.all
  end

  private

end
