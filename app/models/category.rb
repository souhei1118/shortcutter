class Category < ApplicationRecord
  has_many :shortcuts
  validates :name, {presence: true}
end
