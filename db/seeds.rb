require 'yaml'
require 'rails_helper'
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

# users.each do |attrs|
#   User.new(attrs).save(:validate => false)
# end

 # p stories
StoryCreator::create(stories)





