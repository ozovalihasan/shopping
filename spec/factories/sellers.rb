FactoryBot.define do
  factory :seller do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end

FactoryBot.define do
  factory :mock_seller, class: "Seller" do
    sequence(:email) { |n| "mock_seller_#{n}@email.com" }
    sequence(:password) { |n| "password_seller_#{n}" }
  end
end
