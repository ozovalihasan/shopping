FactoryBot.define do
  factory :review do
    body { Faker::Lorem.paragraph }
    rate { Faker::Number.between(from: 1, to: 5)  }
    product_id { Product.ids.sample }
    customer_id { Customer.ids.sample }
  end
end
