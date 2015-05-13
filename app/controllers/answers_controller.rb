class AnswersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user, only: [:show, :edit, :update]

  def show
    @answer = Answer.find_by_id(params[:id])
    @person = @question.person
    @real_bio = @person.bios.where("real" => true)
  end

  def edit
    @answer = Answer.find_by_id(params[:id])
    @bio = Bio.find_by_id(params[:bio_id])

  end

  def update
    @answer = Answer.find_by_id(params[:id])
    @bio = Bio.find_by_id(params[:question].fetch("bio_id"))
    @answer.update_attributes(answer_params)

    @user = current_user

    respond_to do |format|
      format.html
      format.js
    end

  end

  def index
  end

  private

  def answer_params
    params.require(:answer).permit(:bio_id)
  end

  def find_user
    @user = current_user
  end

end