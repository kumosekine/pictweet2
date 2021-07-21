class CommentsController < ApplicationController
  def create
    Comment.create(comments_params)
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
end
