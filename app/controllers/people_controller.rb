class PeopleController < ApplicationController
  def show
    @person = Person.find_by_id(params[:id])
    @bios = @person.bios.sample(5)
  end

  private

end
