class Quiz < ActiveRecord::Base
  belongs_to:section
  has_many:publishquizzes
end
