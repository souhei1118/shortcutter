class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shortcut

  validates :comment, length: { maximum: 80 } #80文字以内であるか
end
