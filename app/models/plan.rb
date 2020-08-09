class Plan < ApplicationRecord
  #リレーションされたパラメータがnilを許可する
  # belongs_to :user, optional: true
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  # def thumbnail
  #   return self.image.variant(resize: '50x50')
  # end
end
