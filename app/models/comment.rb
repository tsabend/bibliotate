class Comment < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :user
end
