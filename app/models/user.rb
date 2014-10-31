class User < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :stories, through: :courses
  has_many :comments

  def is_teacher?
    self.role == "teacher"
  end
end