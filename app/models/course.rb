class Course < ActiveRecord::Base
  has_many :enrollment
  has_many :stories
end
