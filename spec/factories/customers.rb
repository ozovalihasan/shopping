FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end
