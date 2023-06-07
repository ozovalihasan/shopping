FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end


FactoryBot.define do
  factory :mock_admin, class: "Admin" do
    id { (User.last&.id || 0) + 1 }
    sequence(:email) { |n| "mock_admin_#{n}@email.com" }
    sequence(:password) { |n| "password_admin_#{n}" }
  end
end
