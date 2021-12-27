FactoryBot.define do
  factory :member do
    association :team
    association :user

    trait :skip_validate do
      to_create { |i| i.save(null: true) }
    end
  end
end
