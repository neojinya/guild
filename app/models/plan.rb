class Plan < ApplicationRecord
  #リレーションされたパラメータがnilを許可する
  # belongs_to :user, optional: true
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader
  # def thumbnail
  #   return self.image.variant(resize: '50x50')
  # end
end
