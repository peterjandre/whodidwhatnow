class PeopleController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  before_action :find_user, only: [:show, :index, :update]

  def show
    @person = Person.find_by_id(params[:id])
    @bios = @person.bios.sample(5)
    @real_bio = @person.bios.where("real" => true)
    @answer = Answer.new

  end

  def update
    @p = params[:person]
    @bio = Bio.find_by_id(@p[:bio_id])
    @person = Person.find_by_id(params[:id])
    @person.answers.create(answer_params)

    if @bio.real?
      User.increment_counter(:score, @user.id)
      User.increment_counter(:attempts, @user.id)
    else
      User.increment_counter(:attempts, @user.id)
    end 

    respond_to do |format|
      format.html 
      format.js {}
    end

  end

  def index
    @people = Person.all
  end

  private

  def answer_params
    params.require(:person).permit(:bio_id, :user_id, :person_id)
  end

  def find_user
    @user = current_user
  end
end
