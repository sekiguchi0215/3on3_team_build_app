FactoryBot.define do
  factory :member do
    association :team
    association :user
  end
end
