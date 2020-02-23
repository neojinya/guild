class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plans, dependent: :destroy

  validates :name,presence: true #nameの空欄を防ぐバリデーション
  validates :self_introduction, length: {maximum: 200} #自己紹介文を200文字に抑えるバリデーション
end
