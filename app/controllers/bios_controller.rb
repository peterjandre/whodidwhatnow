class BiosController < ApplicationController
  before_action :find_person, only: [:new, :create]

  def new
    @bio = Bio.new
    # @person = Person.find_by_id(params[:person_id])
  end

  def create
    binding.pry
    # @bio = Bio.new(bio_params)
     @bio = @person.bios.build(bio_params)
     binding.pry
     
    if @bio.save
      flash[:notice] = "Your bio was successfully added."
      redirect_to people_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def bio_params
    params.require(:bio).permit(:text, :person_id, :user_id)
  end

  def find_person
    @person = Person.find(params[:person_id])
  end
end
