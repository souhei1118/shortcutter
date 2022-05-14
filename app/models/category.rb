class Category < ApplicationRecord
  has_many :shortcuts
  has_many :quizzes

  validates :name, {presence: true}
end
