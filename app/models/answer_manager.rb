class AnswerManager < ApplicationRecord
  # ユーザーは多数のカテゴリのクイズを挑戦する、
  # クイズのカテゴリは多数のユーザーに挑戦されるので、
  # 多対多になるので中間テーブル（AnswerManager）を作る
  belongs_to :user
  belongs_to :category
end
