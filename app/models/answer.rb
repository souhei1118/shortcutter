class Answer < ApplicationRecord
  belongs_to :answer_manager
  belongs_to :quiz

  # 解答の判定メソッド
  def judgment?(choise)
    # もしchoice（選択肢）とtext（答え）が同じの時
    if choice == text
    # true(正解)にする
      true
    else
    # それ以外の場合はfalse(不正解)にする
      false
    end
  end
end
