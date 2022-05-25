class Public::AnswersController < ApplicationController

  def create
    #Answerテーブルに、text→どの選択肢を選んだか、answer_manager_id→クイズの挑戦の管理id、quiz_id→どのクイズに解答したか、を格納する
    Answer.create(text: params[:choice], answer_manager_id: params[:answer_manager_id], quiz_id: params[:quiz_id] )
    last_quiz = Quiz.find(params[:quiz_id])
    redirect_to category_answer_manager_path(params[:category_id],params[:answer_manager_id], quiz_id: last_quiz.id )
  end
end
