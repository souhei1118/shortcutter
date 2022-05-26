class Quiz < ApplicationRecord
  belongs_to :category
  has_many :answers

  validates :name,    presence: true
  validates :choice1, presence: true
  validates :choice2, presence: true
  validates :choice3, presence: true
  validates :choice4, presence: true
  validates :answer, presence: true

  has_one_attached :quiz_gif

  def get_quiz_gif(width, height)
    unless quiz_gif.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      quiz_gif.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    quiz_gif.variant(
      resize_to_limit: [width, height],
      loader: { page: nil }, # GIFアニメーションの全フレームを変換する
      coalesce: true, # アニメーションシーケンスの最適化
      deconstruct: true, # アニメーションシーケンスの最適化2
      layers: 'Optimize', # GIFアニメーションを最適化
    )
  end
end
