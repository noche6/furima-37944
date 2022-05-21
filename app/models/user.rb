class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :first_name_zenkaku,  presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_zenkaku,   presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name_katakana, presence: true, format:{ with: /\A[ァ-ヶ一-]+\z/}
  validates :last_name_katakana,  presence: true, format:{ with: /\A[ァ-ヶ一-]+\z/}
  validates :birthday,            presence: true
end
