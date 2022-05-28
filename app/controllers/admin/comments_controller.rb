class Admin::CommentsController < ApplicationController
  def destroy
    Comment.find(params[:id]).destroy
    #renderしたときに@shortcut,@commentのデータがないので@shortcut,@commentを定義
    @shortcut = Shortcut.find(params[:shortcut_id])
    render 'admin/comments/review' #render先にjsファイルを指定
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rate )
  end

end
