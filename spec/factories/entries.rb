FactoryBot.define do
  factory :entry do
    association :user
    association :recruitment
  end

  trait :skip_validate do
    to_create { |i| i.save(validate: false) }
  end

  trait :skip_limitation do
    to_create { |i| i.save(null: true) }
  end
end
