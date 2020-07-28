class AnswersController < ApplicationController

  def create

    question = Question.find(params[:answer][:question_id])
    question.answers.create(answer_params)


    # using coockies to remember data entred by a current user of the browser
    session[:current_user_email] = answer_params[:email]

    redirect_to question

  end

  private

  def answer_params

    params.require(:answer).permit(:email, :body)
  
  end

end
