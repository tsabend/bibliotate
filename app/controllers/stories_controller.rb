class StoriesController < ApplicationController

	def index
		@stories = Story.all
	end

	def show
		@story = Story.find(params[:id])
	end

	def comments_for_sentence
		# render json: Comment.where(sentence_id: params[:id])
		render json: Comment.where(sentence_id: params[:id]).as_json(include: [:user])
	end

	def users_for_comments
		render json: Comment.where(sentence_id: params[:id]).pluck(:user_id).map {|id| User.find(id)}
	end
end
