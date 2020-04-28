class Plan < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # def thumbnail
  #   return self.image.variant(resize: '50x50')
  # end
end
