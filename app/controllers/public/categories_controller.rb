class Public::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.page(params[:page]).per(6)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
