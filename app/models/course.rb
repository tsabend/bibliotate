class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :stories

  belongs_to :teacher, class_name: "User", foreign_key: :user_id
end
