class Admin::QuizzesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      flash[:success] = "クイズを作成しました"
      redirect_to admin_quiz_path(@quiz.id)
    else
      flash[:alert] = "クイズの作成に失敗しました"
      render 'new'
    end
  end

  # クイズカテゴリ選択画面
  def category
    @categories = Category.page(params[:page]).per(6)
  end

  #　クイズ一覧画面
  def index
    @quizzes = Quiz.page(params[:page]).per(6)
    if params[:category_id].present?
      #presentメソッドでparams[:category_id]に値が含まれているか確認 => trueの場合下記を実行
      @category = Category.find(params[:category_id])
      @quizzes = @category.quizzes.page(params[:page]).per(6)
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
      flash[:alert] = "クイズの情報の更新に失敗しました"
      render 'edit'
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name,:quiz_gif,:category_id,:choice1,:choice2,:choice3,:choice4,:answer)
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
