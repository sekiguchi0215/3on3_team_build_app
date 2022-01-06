FactoryBot.define do
  factory :room_key do
    association :user
    association :room
  end
end
