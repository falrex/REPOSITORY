class User < ActiveRecord::Base
  has_many:feedbacks
  has_many:studentrecords
end
