class QuestionsController < ApplicationController

  def show

    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc).all

  end

  def create

    Question.create(question_params)

    # using coockies to remember data entred by a current user of the browser
    session[:current_user_email] = question_params[:email]

    redirect_to root_path

  end

  private

  # secure the parameters

  def question_params
    params.require(:question).permit(:email, :body)
  end

end
