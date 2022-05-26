class AnswerManager < ApplicationRecord
  # ユーザーは多数のカテゴリのクイズを挑戦する、
  # クイズのカテゴリは多数のユーザーに挑戦されるので、
  # 多対多になるので中間テーブル（AnswerManager）を作る
  belongs_to :user
  belongs_to :category
  has_many :answers

  def result_true_count
    count = 0
    answers.each do |answer|
      count += 1 if answer.judgment
    end
    return count
  end

  def result_false_quiz
    false_quiz = []
    answers.each do |answer|
      false_quiz.push(answer.quiz) unless answer.judgment
    end

    return false_quiz
  end
end
