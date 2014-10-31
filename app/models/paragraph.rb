class Paragraph < ActiveRecord::Base
  belongs_to :story
  has_many :sentences
end
