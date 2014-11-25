require 'yaml'
# require 'rails_helper'
# include StoryCreatorHelper
# require_relative '../config/environment'
# require File.expand_path('../../app/helpers/story_creator_helper.rb',__FILE__)
# include StoryCreator

path = 'db/seed_data.yaml'
seed_data = YAML.load File.read path

users = seed_data[:users]
enrollments = seed_data[:enrollments]
stories = seed_data[:stories]
comments = seed_data[:comments]
courses = seed_data[:courses]

users.each do |attrs|
  User.new(attrs).save(:validate => false)
end

enrollments.each do |attrs|
  Enrollment.new(attrs).save(:validate => false)
end

comments.each do |attrs|
  Comment.new(attrs).save(:validate => false)
end

courses.each do |attrs|
  Course.new(attrs).save(:validate => false)
end

(1..4).each do |i|
	story = Story.from_body(stories[i][:body])
	story.assign_attributes(title: stories[i][:title], author: stories[i][:author], course_id: 1)
end




