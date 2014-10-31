class StoriesController < ApplicationController
  def index
  end

  def new
    @course = Course.find(params[:course_id])
    @story = Story.new
    # binding.pry
  end

  def create
    binding.pry
    def self.make(title, author, body, course_id)
    Story.make(params[:title: title],params[author: author, course_id: course_id])
    if Story.make(params[:story][:title],params[:story][:author],params[:course_id],)
    # if @story.save
    #   redirect_to @story
    # else
    #   redirect_to 'story#index', :flash => { :error => "Please complete all fields."}
    # end
  end
end
