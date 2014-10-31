class Comment < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :user
  has_many :notifications, as: :noteable
end
