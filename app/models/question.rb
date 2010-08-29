class Question < ActiveRecord::Base
  has_many:publishquizzes
  has_many:choices
end
