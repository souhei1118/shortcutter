class Admin::ShortcutsController < ApplicationController
  def new
    @shortcut = Shortcut.new
  end

  def create
    @shortcut = Shortcut.new(shortcut_params)
    if @shortcut.save
      redirect_to admin_shortcut_path(@shortcut.id)
    else
      render :new
    end
  end

  def index
    @shortcuts = Shortcut.all
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

  def destroy
  end

  private

  def shortcut_params
    params.require(:shortcut).permit(:shortcut_image, :name, :key, :category_id )
  end
end
