class Admin::ShortcutsController < ApplicationController
  def new
    @shortcut = Shortcut.new
  end

  def create
    @shortcut = Shortcut.new(item_params)
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def shortcut_params
    params.require(:shortcut).permit(:shortcut_image, :name, :key, :category_id, :evaluation )
  end
end
