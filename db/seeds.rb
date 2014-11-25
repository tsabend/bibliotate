require 'yaml'

path = 'db/seed_data.yaml'
seed_data = YAML.load File.read path

users = seed_data[:users]
stories = seed_data[:stories]
comments = seed_data[:comments]

users.each do |attrs|
  User.new(attrs).save(:validate => false)
end

comments.each do |attrs|
  Comment.new(attrs).save(:validate => false)
end

(1..4).each do |i|
	story = Story.from_body(stories[i][:body])
	story.assign_attributes(title: stories[i][:title], author: stories[i][:author])
end