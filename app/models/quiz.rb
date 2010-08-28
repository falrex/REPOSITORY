class Quiz < ActiveRecord::Base
  belongs_to:subject
  has_many:publishquizzes
  has_many:studentrecords
end
