FactoryBot.define do
  factory :entry do
    user_id { FactoryBot.create(:user).id }
    recruitment_id { FactoryBot.create(:recruitment).id }
  end

  trait :skip_validate do
    to_create { |i| i.save(validate: false) }
  end
end
