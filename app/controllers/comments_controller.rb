class CommentsController < ApplicationController
  before_action :login_checkup

  def index
    @event = Event.find(params[:id])
    @comments = @event.comments
  end

  def add_comment
    @comment = current_user.comments.new(event_id: params[:id], comment: comment_params[:commenttext])

    return unless @comment.save

    redirect_to show_comments_path(params[:id])
  end

  def like_comment
    like = current_user.likes.find_or_create_by(comment_id: params[:id])
    eventid = like.comment.event_id
    redirect_to show_comments_path(eventid)
  end

  def unlike_comment
    @like = current_user.likes.find_by(comment_id: params[:id])
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

  def comment_params
    params.require(:comment).permit(:commenttext)
  end
end
