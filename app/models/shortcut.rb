class Shortcut < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :category

  validates :name,           presence: true
  validates :key,            presence: true
  validates :shortcut_image, presence: true

  has_one_attached :shortcut_image

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def get_shortcut_image(width, height)
    unless shortcut_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      shortcut_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    shortcut_image.variant(
      resize_to_limit: [width, height],
      loader: { page: nil }, # GIFアニメーションの全フレームを変換する
    )
  end

end
