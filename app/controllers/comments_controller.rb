class CommentsController < ApplicationController
  before_action :login_checkup

  def index
    @comments = Comment.where(event_id: params[:id])
    @event = Event.find(params[:id])
  end

  def add_comment
    @comment = Comment.new(event_id: params[:id], user_id: session[:current_user_id], comment: params[:comment])

    return unless @comment.save

    redirect_to show_comments_path(params[:id])
  end

  def like_comment
    like = Like.find_or_create_by(user_id: session[:current_user_id], comment_id: params[:id])
    eventid = like.comment.event_id
    redirect_to show_comments_path(eventid)
  end

  def unlike_comment
    @like = Like.find_by(user_id: session[:current_user_id], comment_id: params[:id])
    eventid = @like.comment.event_id
    @like.destroy
    redirect_to show_comments_path(eventid)
  end

  private

  def login_checkup
    return if logged_in?

    flash[:notice] = 'You have to first login.'
    redirect_to users_path
  end
end
