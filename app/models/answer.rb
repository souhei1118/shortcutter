class Answer < ApplicationRecord
  belongs_to :answer_manager
  belongs_to :quiz

  # 解答の判定メソッド
  def judgment?(answer)
    # もしanswer（答え）とtext（解答）が同じの時
    if answer == text
    # true(正解)にする
      true
    else
    # それ以外の場合はfalse(不正解)にする
      false
    end
  end
end
