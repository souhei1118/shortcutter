class Public::BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmarks.all
  end

  def create
    shortcut = Shortcut.find(params[:shortcut_id])
    bookmark = current_user.bookmarks.new(shortcut_id: shortcut.id)
    bookmark.save
    redirect_to shortcut_path(shortcut)
  end

  def destroy
    shortcut = Shortcut.find(params[:shortcut_id])
    bookmark = current_user.bookmarks.find_by(shortcut_id: shortcut.id)
    bookmark.destroy
    redirect_to shortcut_path(shortcut)
  end
end
