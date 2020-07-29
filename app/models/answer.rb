class Answer < ApplicationRecord

  belongs_to :question

  include HasGravatar

end
