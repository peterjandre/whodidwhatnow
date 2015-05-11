class PeopleController < ApplicationController
  before_action :find_user, only: [:show, :index]

  def show
    @person = Person.find_by_id(params[:id])
    @bios = @person.bios.sample(5)

    respond_to do |format|
      format.html 
      format.js
    end
  end

  def index
    @people = Person.all
  end

  private

  def choice_params
    params.require(:choice).permit(:user_id, :bio_id)
  end

  def find_user
    @user = current_user
  end
end
