class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :situation, :burden, :prefectures, :delivery
  validates :category_id, :situation_id, :burden_id, :prefectures_id, :delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :burden_id, presence: true
  validates :prefectures_id, presence: true
  validates :delivery_id, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
