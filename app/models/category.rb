class Category < ApplicationRecord
  has_many :shortcuts
  has_many :quizzes
  has_many :answers

  validates :name, {presence: true}
end
