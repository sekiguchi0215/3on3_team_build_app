FactoryBot.define do
  factory :member do
    room_id { FactoryBot.create(:room).id }
    user_id { FactoryBot.create(:user).id }
  end
end
