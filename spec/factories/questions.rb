FactoryBot.define do
  factory :question do
    body { Faker::Lorem.paragraph }
    product_id { Product.ids.sample }
    customer_id { Customer.ids.sample }
  end
end


FactoryBot.define do
  factory :mock_question, class: "Question" do
    sequence(:body) { |n| "body#{n}" }
    product_id { Product.ids.sample }
    customer_id { Customer.ids.sample }
  end
end
