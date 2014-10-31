class Story < ActiveRecord::Base
  has_many :sentences
  belongs_to :course
end
