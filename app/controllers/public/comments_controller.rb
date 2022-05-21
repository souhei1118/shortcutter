class Public::CommentsController < ApplicationController
  def create
    @shortcut = Shortcut.find(params[:shortcut_id])
    comment = current_user.comments.new(comment_params)
    comment.shortcut_id = @shortcut.id
    comment.save
    @comment = Comment.new
    render 'public/comments/review' #render先にjsファイルを指定
  end

  def destroy
    Comment.find(params[:id]).destroy
    #renderしたときに@shortcutのデータがないので@shortcutを定義
    @shortcut = Shortcut.find(params[:shortcut_id])
    render 'public/comments/review' #render先にjsファイルを指定
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rate )
  end

end
