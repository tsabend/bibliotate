class Sentence < ActiveRecord::Base
  has_many :comments
  belongs_to :paragraph
end
