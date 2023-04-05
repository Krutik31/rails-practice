module CommentsHelper
  def liked_comment?(comid, user)
    user.likes.find_by(comment_id: comid).present?
  end
end
