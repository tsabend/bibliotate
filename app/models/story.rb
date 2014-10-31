class Story < ActiveRecord::Base
  has_many :paragraphs
  has_many :sentences, through: :paragraphs
  has_many :comments, through: :sentences
  belongs_to :course
end
