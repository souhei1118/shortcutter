class Public::CommentsController < ApplicationController
  def create
    shortcut = Shortcut.find(params[:shortcut_id])
    comment = current_user.comments.new(comment_params)
    comment.shortcut_id = shortcut.id
    comment.save
    redirect_to shortcut_path(shortcut)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to shortcut_path(params[:shortcut_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rate )
  end

end
