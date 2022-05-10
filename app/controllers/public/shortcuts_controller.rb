class Public::ShortcutsController < ApplicationController
  def index
    @shortcuts = Shortcut.all
  end

  def show
    @shortcuts = Shortcut.find(params[:id])
    @comment = Comment.new
  end
end
