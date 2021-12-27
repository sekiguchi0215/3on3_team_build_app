FactoryBot.define do
  factory :room_key do
    association :user
    association :room

    trait :skip_validate do
      to_create { |i| i.save(validate: false) }
    end
  end
end
