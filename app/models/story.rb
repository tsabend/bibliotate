class Story < ActiveRecord::Base
  has_many :paragraphs
  belongs_to :course
end
