class Public::CommentsController < ApplicationController
  def create
    shortcut = Shortcut.find(params[:shortcut_id])
    comment = current_user.comments.new(comment_params)
    comment.shortcut_id = shortcut_id
    comment.save
    redirect_to shortcut_path(shortcut)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
