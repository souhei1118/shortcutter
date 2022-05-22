class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true

  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :answers

  has_one_attached :profile_image

# プロフィール画像用メソッド
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

# 退会機能メソッド
  def active_for_authentication?
    super && (is_deleted == false)
  end

# ゲストログイン機能メソッド
  def self.guest
    find_or_create_by!(nickname: 'ゲストユーザー' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲストユーザー"
    end
  end

end
