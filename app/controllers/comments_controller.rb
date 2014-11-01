class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.save
    data = {comment: comment, user: comment.user}
    render :json => data
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





