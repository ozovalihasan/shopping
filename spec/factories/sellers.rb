FactoryBot.define do
  factory :seller do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end

FactoryBot.define do
  factory :mock_seller, class: "Seller" do
    id { (User.last&.id || 0) + 1 }
    sequence(:username) { |n| "mock_seller_username#{n}" }
    sequence(:email) { |n| "mock_seller_#{n}@email.com" }
    sequence(:password) { |n| "password_seller_#{n}" }
  end
end
