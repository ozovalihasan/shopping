FactoryBot.define do
  factory :answer do
    body { Faker::Lorem.paragraph }
    question_id { Question.ids.sample }
    seller_id { User.ids.sample }
  end
end


FactoryBot.define do
  factory :mock_answer, class: "Answer" do
    sequence(:body) { |n| "body#{n}" }
    question_id { Question.ids.sample }
    seller_id { User.ids.sample }
  end
end
