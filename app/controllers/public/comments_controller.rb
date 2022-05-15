class Public::CommentsController < ApplicationController
  def create
    shortcut = Shortcut.find(params[:shortcut_id])
    comment = current_user.comments.new(comment_params)
    comment.shortcut_id = shortcut.id
    comment.save
    redirect_to shortcut_path(shortcut)
    flash[:success] = "レビューを投稿しました！"
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to shortcut_path(params[:shortcut_id])
    flash[:success] = "レビューを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rate )
  end

end
