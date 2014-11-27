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

	def new_comments_for_story
		render json: Story.find(params[:id]).comments.limit(5).as_json(include: [:user])
	end

	def most_commented_sentences_for_story
		render json: Story.find(params[:id]).comments.limit(5).as_json(include: [:user])
	end
end
