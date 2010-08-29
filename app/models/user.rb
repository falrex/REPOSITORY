class User < ActiveRecord::Base
  has_many:feedbacks
  has_many:studentrecords
  has_many:sections
end
