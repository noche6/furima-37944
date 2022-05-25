FactoryBot.define do
  factory :item do
    item_name { 'Tシャツ' }
    description { 'あああああ' }
    category_id { 2 }
    situation_id { 2 }
    burden_id { 2 }
    prefectures_id { 2 }
    delivery_id { 2 }
    price { '300' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
