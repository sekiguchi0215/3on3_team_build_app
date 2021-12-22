FactoryBot.define do
  factory :member do
    team_id { FactoryBot.create(:team).id }
    user_id { FactoryBot.create(:user).id }
  end
end
