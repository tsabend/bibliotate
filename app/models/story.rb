class Story < ActiveRecord::Base
  attr_accessor :file, :remote_file_url

  has_many :paragraphs
  has_many :sentences, through: :paragraphs
  has_many :comments,  -> { order(created_at: :desc) }, through: :sentences
  validates :title, presence: true
  validates :course_id, presence: true
  belongs_to :course

  def self.from_body(body)
    instance = self.new
    instance.paragraphs = StoryParserConcern.to_paragraphs(body).map do |paragraph_text|
      paragraph = Paragraph.new
      paragraph.sentences = StoryParserConcern.to_sentences(paragraph_text).map do |sentence|
        Sentence.new(body: sentence)
      end
      paragraph
    end
    instance
  end


end