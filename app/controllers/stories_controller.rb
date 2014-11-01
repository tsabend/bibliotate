class StoriesController < ApplicationController
  def index
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @courses = Course.where(user_id:3)
    @story = Story.new
  end

  def create
    if params[:story][:author] == ""
      params[:story][:author] = "Unknown"
    end
    @story = Story.make(params[:story][:title],params[:story][:author],params[:story_body],params[:course_id])
    if @story
      redirect_to @story
    else
      redirect_to 'story#new', :flash => {:messages => "Please complete all fields."}
    end
  end
end

