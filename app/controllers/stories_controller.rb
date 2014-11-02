class StoriesController < ApplicationController
  include StoryHelper
  def index
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @courses = Course.where(user_id:current_user.id)
    @story = Story.new
  end

  def create
    if params[:story][:author] == ""
      params[:story][:author] = "Unknown"
    end
    # params[:story_body] = sanitize(params[:story_body])

    @story = Story.make(params[:story][:title],params[:story][:author],params[:story_body],params[:course_id])
    if @story.valid?
      redirect_to @story
    else
      flash[:messages] = @story.errors.full_messages
      redirect_to new_story_path
    end
  end

  def destroy
    Story.destroy(params[:id])
    redirect_to '/'
    # redirect_to user_path
  end

end

