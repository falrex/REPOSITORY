class Quiz < ActiveRecord::Base
  belongs_to:sections
  has_many:publishquizzes
  has_many:studentrecords
end
