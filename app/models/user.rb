class User < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, through: :enrollments

  has_many :comments

  has_many :notifications

  has_many :courses

  #returns boolean true or false if user is a teacher
  def is_teacher?
    self.role.downcase == "teacher"
  end
end
