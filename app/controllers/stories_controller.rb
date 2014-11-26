class StoriesController < ApplicationController

	def index
		@stories = Story.all
	end

	def show
		@story = Story.find(params[:id])
	end

	def comments_for_sentence
		render json: Comment.where(sentence_id: params[:id]).as_json(include: [:user])
	end

	def create_comment_for_sentence
		comment = Comment.new(
			body: params[:comment][:body],
			user_id: 1,
			sentence_id: params[:id]
		)
		puts comment
		comment.save!
		render json: comment
	end
end
