FactoryBot.define do
  factory :entry do
    association :user
    association :recruitment
  end
end
