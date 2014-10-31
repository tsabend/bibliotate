class User < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :comments
  include StoryCreator
end
