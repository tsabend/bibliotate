class StoriesController < ApplicationController
  def index
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @story = Story.new
    # binding.pry
  end

  def create
    if Story.make(params[:story][:title],params[:story][:author],params[:story_body],params[:course_id])
    @story = Story.last
    @story
    else
      redirect_to 'story#index', :flash => {:error => "Please complete all fields."}
    end
  end
end
