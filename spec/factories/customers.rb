FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end

FactoryBot.define do
  factory :mock_customer, class: "Customer" do
    id { (User.last&.id || 0) + 1 }
    sequence(:email) { |n| "mock_customer_#{n}@email.com" }
    sequence(:password) { |n| "password_customer_#{n}" }
  end
end
