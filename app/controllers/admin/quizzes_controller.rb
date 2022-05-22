class Admin::QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to admin_quiz_path(@quiz.id)
      flash[:success] = "クイズを作成しました"
    else
      render 'new'
    end
  end

  # クイズカテゴリ選択画面
  def category
    @categories = Category.all
  end

  #　クイズ一覧画面
  def index
    @quizzes = Quiz.all
    if params[:category_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
      @category = Category.find(params[:category_id])
      @quizzes = @category.quizzes
    end
  end

  # クイズ詳細画面
  def show
    @quiz = Quiz.find(params[:id])
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to admin_quiz_path
      flash[:success] = "クイズ情報を更新しました"
    else
      @quiz = Quiz.find(params[:id])
      render 'edit'
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name,:quiz_gif,:category_id,:choice1,:choice2,:choice3,:choice4)  #choice1が正解のカラム
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
