class QuestionsController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]

  def show
    @question = Question.find_by_id(params[:id])
    @person = @question.person
    @real_bio = @person.bios.where("real" => true)
  end

  def edit
    @question = Question.find_by_id(params[:id])
    @bio = Bio.find_by_id(params[:bio_id])

  end

  def update
    @question = Question.find_by_id(params[:id])
    @bio = Bio.find_by_id(params[:question].fetch("bio_id"))
    @question.update_attributes(question_params)

    respond_to do |format|
      format.html
      format.js
    end

    if @bio.real?
      flash[:notice] = "CORRECT!"
      @user.score += 1
      @user.attempts += 1
    else
      flash[:alert] = "Incorrect."
      @user.attempts += 1
    end
    @user.save

  end

  def index
  end

  private

  def question_params
    params.require(:question).permit(:bio_id)
  end

  def find_user
    @user = current_user
  end

end