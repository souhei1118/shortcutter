class Public::AnswersController < ApplicationController

  def create
    Answer.create(text: params[:choice], answer_manager_id: params[:answer_manager_id] )
    last_quiz = Quiz.find(params[:quiz_id])
 
    quiz = Quiz.where('id >= ?', rand(Quiz.first.id..Quiz.last.id) ).reject {|q| q.id == last_quiz.id}.first
    redirect_to category_answer_manager_path(params[:category_id],params[:answer_manager_id], quiz_id: last_quiz.id )
  end
end
