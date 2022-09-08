FactoryBot.define do
  factory :seller do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end
