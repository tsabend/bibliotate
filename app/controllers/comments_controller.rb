class CommentsController < ApplicationController

  def create
    puts "FOOBAR"
    comment = Comment.new(comment_params)
    comment.user_id = 1
    comment.save
    @sentence = Sentence.find(1)
    redirect_to comment
  end

  def show
    @sentence_id = params[:id]
    @comments = Comment.where(sentence_id: @sentence_id)
    render partial: 'comment_display'
  end

  private

  def comment_params
    params.permit(:body, :sentence_id, :user_id)
  end

end
