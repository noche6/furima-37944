FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name_zenkaku    {japanese_user.first.kanji}
    last_name_zenkaku     {japanese_user.last.kanji}
    first_name_katakana   {japanese_user.first.katakana}
    last_name_katakana    {japanese_user.last.katakana}
    birthday              {Faker::Date.birthday}

  end
end