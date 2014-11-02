class Comment < ActiveRecord::Base
  after_save :process_hashtags

  belongs_to :sentence
  belongs_to :user
  has_many :notifications, as: :noteable
  has_many :hashtags
  def story
    self.sentence.paragraph.story
  end

  def story_sentence
    self.sentence.id - self.story.sentences.first.id + 1
  end

  def hashtag_extractor
    words = self.body.split(" ")
    hashtags = words.select {|word| word.chars.first == "#" }
    hashtags
	end

	def process_hashtags
    tags = hashtag_extractor
    tags.map do |tag|
	    Hashtag.create(tag: tag, user: self.user, comment: self)
    end
	end

end
