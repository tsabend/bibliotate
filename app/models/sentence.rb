class Sentence < ActiveRecord::Base
  has_many :comments
  belongs_to :paragraph

  def commented?
    self.comments.size > 0
  end
end
