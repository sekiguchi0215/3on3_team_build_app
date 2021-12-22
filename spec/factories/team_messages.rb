FactoryBot.define do
  factory :team_message do
    user_id { FactoryBot.create(:user).id }
    team_id { FactoryBot.create(:team).id }
    message { Faker::Lorem.sentence }
  end
end
