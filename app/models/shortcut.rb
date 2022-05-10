class Shortcut < ApplicationRecord
  has_one_attached :shortcut_image

  def get_shortcut_image(width, height)
    unless shortcut_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      shortcut_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    shortcut_image.variant(resize_to_limit: [width, height]).processed
  end

end
