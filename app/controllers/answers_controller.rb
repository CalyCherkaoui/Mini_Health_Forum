class AnswersController < ApplicationController

  def create

    question = Question.find(params[:answer][:question_id])
    answer = question.answers.create(answer_params)

    # whene we create an answer an email is sent to the questioner prepare the email then send it
    # MainMailer.notify_question_author(answer).deliver_now if we want to deviler it now we should wait until it is executed
    # with deliver_later the line is executer in the background (it is used witha dapter for active job) we use the gem sucker_punch

    MainMailer.notify_question_author(answer).deliver_later

    # using coockies to remember data entred by a current user of the browser
    session[:current_user_email] = answer_params[:email]

    redirect_to question

  end

  private

  def answer_params

    params.require(:answer).permit(:email, :body)
  
  end

end
