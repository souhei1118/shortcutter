class Public::QuizzesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @quiz = Quiz.where( 'id >= ?', rand(Quiz.first.id..Quiz.last.id) ).first
  end

  def create
  end

  def result
    # ログインしているユーザーが正解した結果を見つける
    @result_true = current_user.answer.where(result: 'true')
    # 不正解だった結果を見つける
    @result_false = current_user.answer.where(result: 'false')
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name,:quiz_gif,:category_id,:choice1,:choice2,:choice3,:choice4,:answer)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
