class User < ActiveRecord::Base
  has_many:studentrecords
  has_many:classlists
  has_many:feedbacks
end
