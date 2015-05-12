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

    @user = current_user

    if @bio.real?
      add_score = @user.score += 1
      add_attempt = @user.attempts += 1
    else
      add_attempt
    end
    @user.update_attributes(score: add_score, attempts: add_attempt)

    respond_to do |format|
      format.html
      format.js
    end

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