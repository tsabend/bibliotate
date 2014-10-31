class StoriesController < ApplicationController
  def index
  end

  def show
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to @story
    else
      redirect_to 'story#index', :flash => { :error => "Please complete all fields."}
    end
  end

end
