class Public::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
end
