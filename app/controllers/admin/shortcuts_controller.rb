class Admin::ShortcutsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shortcut = Shortcut.new
  end

  def create
    @shortcut = Shortcut.new(shortcut_params)
    if @shortcut.save
      flash[:success] = "ショートカットを作成しました"
      redirect_to admin_shortcut_path(@shortcut.id)
    else
      flash[:alert] = "ショートカットの作成に失敗しました"
      render :new
    end
  end

  def category
    @categories = Category.page(params[:page]).per(6)
  end

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
      flash[:alert] = "ショートカット情報の更新に失敗しました"
      render 'edit'
    end
  end

  private

  def shortcut_params
    params.require(:shortcut).permit(:shortcut_image, :name, :key, :category_id )
  end
end
