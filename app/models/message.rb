class Message < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :content, presence: true,  unless: :image?

end
