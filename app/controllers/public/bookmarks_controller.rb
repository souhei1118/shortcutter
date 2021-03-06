class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id).page(params[:page]).per(10)
  end

  def create
    @shortcut = Shortcut.find(params[:shortcut_id])
    bookmark = @shortcut.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @shortcut = Shortcut.find(params[:shortcut_id])
    bookmark = @shortcut.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
  end
end
