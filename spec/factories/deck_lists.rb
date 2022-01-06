FactoryBot.define do
  factory :deck_list do
    association :user
    deck_list { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.png")) }
    status { "public" }
    content { Faker::Lorem.paragraph }

    trait :invalid do
      status { nil }
    end
  end
end
