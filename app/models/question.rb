class Question < ApplicationRecord

  has_many :answers

  include HasGravatar

end
