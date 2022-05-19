class Public::BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def create
    @shortcut = Shortcut.find(params[:shortcut_id])
    bookmark = @shortcut.bookmarks.new(user_id: current_user.id)
    bookmark.save
    redirect_to shortcut_path(@shortcut)
    flash[:success] = "ブックマークに登録しました"
  end

  def destroy
    @shortcut = Shortcut.find(params[:shortcut_id])
    bookmark = @shortcut.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
    redirect_to shortcut_path(@shortcut)
    flash[:success] = "ブックマークから削除しました"
  end
end
