class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categories = Category.page(params[:page]).per(7)
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

  def destroy
    @category = Category.find(params[:id]).destroy
    @categories = Category.page(params[:page]).per(7)
    @category = Category.new
    render 'index'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
