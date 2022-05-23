class Category < ApplicationRecord
  has_many :shortcuts
  has_many :quizzes
  has_many :answe_managers

  validates :name, {presence: true}
end
