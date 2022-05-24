class Admin::ShortcutsController < ApplicationController
  def new
    @shortcut = Shortcut.new
  end

  def create
    @shortcut = Shortcut.new(shortcut_params)
    if @shortcut.save
      redirect_to admin_shortcut_path(@shortcut.id)
      flash[:success] = "ショートカットを作成しました"
    else
      render :new
    end
  end

  def category
    @categories = Category.all
  end

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
  end

  def edit
    @shortcut = Shortcut.find(params[:id])
  end

  def update
    @shortcut = Shortcut.find(params[:id])
    if @shortcut.update(shortcut_params)
      redirect_to admin_shortcut_path
      flash[:success] = "ショートカット情報を更新しました"
    else
      @shortcut = Shortcut.find(params[:id])
      render 'edit'
    end
  end

  private

  def shortcut_params
    params.require(:shortcut).permit(:shortcut_image, :name, :key, :category_id )
  end
end
