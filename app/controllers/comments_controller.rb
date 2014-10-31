class CommentsController < ApplicationController

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
