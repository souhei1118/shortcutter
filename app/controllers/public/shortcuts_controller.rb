class Public::ShortcutsController < ApplicationController
  def index
    @shortcuts = Shortcut.all
    if params[:category_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
      @category = Category.find(params[:category_id])
      @shortcuts = @category.shortcuts
    end
  end

  def show
    @shortcut = Shortcut.find(params[:id])
    @comment = Comment.new
  end

  private

  def shortcut_params
    params.require(:shortcut).permit(:shortcut_image, :name, :key, :category_id )
  end

end
