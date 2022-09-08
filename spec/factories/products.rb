FactoryBot.define do
  factory :product do
    quantity { Faker::Number.number(digits: 2) }
    name { Faker::Device.model_name }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    description { Faker::Lorem.paragraph }
    review_count { Faker::Number.number(digits: 1) }
    total_review_score { Faker::Number.number(digits: 2) }
    seller_id { Seller.ids.sample }
    category_id { Category.ids.sample }
  end
end
