FactoryBot.define do
  factory :recruitment do
    user_id { FactoryBot.create(:user).id }
    number_of_applicants { "two" }
    event_title { Faker::Lorem.characters }
    recruitment_condition { "enjoy" }
    introduction { Faker::Lorem.sentence }
  end
end
