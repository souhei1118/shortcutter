class Public::ShortcutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shortcuts = Shortcut.page(params[:page]).per(5)
    if params[:category_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
      @category = Category.find(params[:category_id])
      @shortcuts = @category.shortcuts.page(params[:page]).per(5)
    end
  end

  def show
    @shortcut = Shortcut.find(params[:id])
    @comment = Comment.new
  end
end
