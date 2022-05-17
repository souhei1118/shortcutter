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
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:success] = "カテゴリ情報を更新しました"
    else
      flash[:alert] = "カテゴリ情報を更新できませんでした"
      @category = Category.find(params[:id])
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
