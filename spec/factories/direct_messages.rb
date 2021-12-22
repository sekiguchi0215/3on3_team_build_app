FactoryBot.define do
  factory :direct_message do
    user_id { FactoryBot.create(:user).id }
    room_id { FactoryBot.create(:room).id }
    message { Faker::Lorem.sentence }
  end
end
