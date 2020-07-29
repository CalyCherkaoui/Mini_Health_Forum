require 'test_helper'

class MainMailerTest < ActionMailer::TestCase
  test "notify_question_author" do

    question = Question.create email: 'author@question.com', body: 'a test question'
    answer = Answer.create email: 'author@answer.com', body: 'a test answer'
    # make sure the question and the answer are associated
    question.answers << answer

    mail = MainMailer.notify_question_author(answer)
    assert_equal "New answer to your question", mail.subject

    # reciever of the email
    assert_equal [question.email], mail.to

    # sender of the email
    assert_equal [answer.email], mail.from

    assert_match answer.body, mail.body.encoded
  end

end
