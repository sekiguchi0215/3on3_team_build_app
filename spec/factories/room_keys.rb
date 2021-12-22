FactoryBot.define do
  factory :room_key do
    room_id { FactoryBot.create(:room).id }
    user_id { FactoryBot.create(:user).id }
  end
end
