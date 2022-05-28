class Public::QuizzesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.page(params[:page]).per(6)
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name,:quiz_gif,:category_id,:choice1,:choice2,:choice3,:choice4,:answer)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
