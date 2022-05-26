class Public::AnswersController < ApplicationController

  def create
    #Answerテーブルに、text→どの選択肢を選んだか、answer_manager_id→クイズの挑戦の管理id、quiz_id→どのクイズに解答したか、を格納する
    Answer.create(text: params[:choice], answer_manager_id: params[:answer_manager_id], quiz_id: params[:quiz_id] )
    @category = Category.find(params[:category_id])
    @answer_manager = AnswerManager.find(params[:answer_manager_id])

    #②パラメータのquiz_idがnilでない時（答えたクイズのIDを持っている時）
    unless params[:quiz_id].nil?

      #③idsすでに答えたクイズのIDをpluck(レコードを取得)する
      ids = @answer_manager.answers.pluck(:quiz_id)

      #④where.not(id: ids).pluck(:id).shuffle[0] = すでに答えたクイズ"以外"をシャッフルで（カテゴリに紐づくクイズを）一つ取り出す
      quiz_id = @answer_manager.category.quizzes.where.not(id: ids).pluck(:id).shuffle[0]
      @quiz = Quiz.find_by(id: quiz_id)

      #⑤もし挑戦したクイズの解答が１０個になったとき、結果画面に遷移する（この時answer_managerのidを引数として渡して情報を送る）
      if @answer_manager.answers.count == 10
        # redirect_to result_category_answer_manager_path(@category,@answer_manager)
        flash[:success] = "お疲れ様でした！間違えた問題があればもう一度復習しよう！"
        @result = @answer_manager
        render 'public/answer_managers/result'
      end
    else
      #①パラメータのquiz_idがnilの時（クイズを一問も答えていない時）一番初めの問題はここでまず一つ取得
      @quiz = @category.quizzes.where('id >= ?', rand(Quiz.first.id..Quiz.last.id) ).first
    end
    #last_quiz = Quiz.find(params[:quiz_id])
    #redirect_to category_answer_manager_path(params[:category_id],params[:answer_manager_id], quiz_id: last_quiz.id )
  end
end
