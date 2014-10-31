class Comment < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :user
  has_many :notifications, as: :noteable

  def story
    self.sentence.paragraph.story.title
  end
end
