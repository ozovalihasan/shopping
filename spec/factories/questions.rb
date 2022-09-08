FactoryBot.define do
  factory :question do
    body { Faker::Lorem.paragraph }
    product_id { Product.ids.sample }
    customer_id { Customer.ids.sample }
  end
end
