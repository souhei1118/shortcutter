class Answer < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :quiz

  # 解答の判定メソッド
  def judgment
    # もしchoice1(答え)と解答が同じの時
    if choice1 = answer
    # result(結果)をtrue(正解)にする
      result == true
    else
    # それ以外の場合はresult(結果)をfalse(不正解)にする
      result == false
    end
  end
end
