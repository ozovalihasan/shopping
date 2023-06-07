FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end

FactoryBot.define do
  factory :mock_user, class: "User" do
    id { (User.last&.id || 0) + 1 }
    sequence(:email) { |n| "mock_user_#{n}@email.com" }
    sequence(:password) { |n| "password_user_#{n}" }
  end
end
