FactoryBot.define do
  factory :answer do
    body { Faker::Lorem.paragraph }
    question_id { Question.ids.sample }
    seller_id { User.ids.sample }
  end
end
