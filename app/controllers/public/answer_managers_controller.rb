class Public::AnswerManagersController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @answer_manager = AnswerManager.find(params[:id])
    #カテゴリーに紐付くクイズをランダムで一つ取り出す
    @quiz = @category.quizzes.where( 'id >= ?', rand(Quiz.first.id..Quiz.last.id) ).first
    # last_quiz = Quiz.find(params[:quiz_id])
    # @quiz = Quiz.where('id >= ?', rand(Quiz.first.id..Quiz.last.id) ).reject {|q| q.id == last_quiz.id}.first

    # 毎回回答の数が何件か確認する
    #もし挑戦したクイズの解答が１０個になったとき
    if @answer_manager.answers.count == 10
      #結果画面に遷移する（この時answer_managerのidを引数として渡して情報を送る）
      redirect_to result_category_answer_manager_path(@answer_manager)
      flash[:success] = "お疲れ様でした！間違えた問題があればもう一度復習しよう！"
    end
  end

  def create
    answe_manager = AnswerManager.create(user_id: current_user.id, category_id: params[:category_id])
    redirect_to category_answer_manager_path(params[:category_id], answe_manager.id)
  end

  def result
    @result = AnswerManager.find(params[:id])
  end
end
