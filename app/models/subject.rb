class Subject < ActiveRecord::Base
  has_many:classlists
  has_many:quizzes
  has_many:sections
end
