class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      flash[:alert] = "カテゴリ名を入力してください"
      redirect_to
    end
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
