class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipalities, :address, :building, :number, :user_id, :item_id

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}+\z/ }
  validates :prefectures_id, presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :number, presence: true, format: { with: /\A[0-9]{10,11}+\z/ }
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    order = Order.create( user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building: building,number: number, order_id: order.id)
  end 


end