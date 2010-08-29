class Section < ActiveRecord::Base
  belongs_to:subjects
  has_many:quizzes
  has_many:classlists
end
