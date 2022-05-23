class Answer < ApplicationRecord
  belongs_to :answer_manager
  belongs_to :quiz

  # 解答の判定メソッド
  def judgment?(choise)
    # もしchoice(答え)と解答が同じの時
    if choice == text
    # result(結果)をtrue(正解)にする
      true
    else
    # それ以外の場合はresult(結果)をfalse(不正解)にする
       false
    end
  end
end
