class Public::AnswerManagersController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @answer_manager = AnswerManager.find(params[:id])
    @quiz = @category.quizzes.where( 'id >= ?', rand(Quiz.first.id..Quiz.last.id) ).first
    # last_quiz = Quiz.find(params[:quiz_id])
    # @quiz = Quiz.where('id >= ?', rand(Quiz.first.id..Quiz.last.id) ).reject {|q| q.id == last_quiz.id}.first
  end

  def create
    answe_manager = AnswerManager.create(user_id: current_user.id, category_id: params[:category_id])
    redirect_to category_answer_manager_path(params[:category_id], answe_manager.id)
  end
end
