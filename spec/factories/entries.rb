FactoryBot.define do
  factory :entry do
    user_id { FactoryBot.create(:user).id }
    recruitment_id { FactoryBot.create(:recruitment).id }
  end
end
