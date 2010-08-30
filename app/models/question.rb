class Question < ActiveRecord::Base
  has_many:choices
  has_many:publishquizzes
  belongs_to:subject
end
