class StoriesController < ApplicationController

	def index
		@stories = Story.all
	end

	def show
		@story = Story.find(params[:id])
	end

	def comments_for_sentence
		render json: Sentence.find(params[:id]).comments
	end
end
