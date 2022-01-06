FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    introduction { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    password { "password" }
  end
end
