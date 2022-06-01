FactoryBot.define do
  factory :order_address do
    postal_code { '000-0000' }
    prefectures_id { 2 }
    municipalities { '刈谷市' }
    address { '板倉町1-3-2' }
    number { '00000000000' }
    token {'tok_abcdefghijk00000000000000000'}
  end
end
