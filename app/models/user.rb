class User < ActiveRecord::Base
  has_many:studentrecords
  has_many:classlists
end
