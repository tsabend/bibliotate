class Sentence < ActiveRecord::Base
  belongs_to :paragraph
  has_many :comments
  after_create :mark_sentence_number

  def mark_sentence_number
	  self.number = id - paragraph.story.sentences.first.id + 1
	  self.save
	end

	def commented?
		comments.size > 0
	end
end
