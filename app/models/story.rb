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

  def newest_comments
    comments.first(5)
  end
    # This ruby should be replaced by activerecord query
  def most_commented
    sentences.sort_by {|sentence| sentence.comment_count}.reverse[0..4]
  end
    # This ruby should be replaced by activerecord query
  def active_users
    user_frequency = {}
    comments.each do |comment|
        user_frequency[comment.user] = user_frequency[comment.user] ||= 1
        user_frequency[comment.user] += 1
    end
    user_frequency.sort_by {|k,v| v}.reverse[0..4]
  end
end