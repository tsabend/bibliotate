class StoriesController < ApplicationController
  def index
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @courses = Course.find_by(user_id:1)
    @story = Story.new
  end

  def create
    if params[:story][:author] == ""
      params[:story][:author] = "Unknown"
    end
    if Story.make(params[:story][:title],params[:story][:author],params[:story_body],params[:course_id])
      @story = Story.all.last
      # binding.pry
      redirect_to @story
    else
      redirect_to 'story#index', :flash => {:error => "Please complete all fields."}
    end
  end
end



