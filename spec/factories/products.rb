FactoryBot.define do
  factory :product do
    color { Faker::Color.color_name }
    quantity { Faker::Number.number(digits: 2) }
    description { Faker::Lorem.paragraph }
    name { Faker::Commerce.product_name }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    review_count { Faker::Number.number(digits: 1) }
    total_review_score { Faker::Number.number(digits: 2) }
    seller_id { Seller.ids.sample }
    category_id { SubCategory.ids.sample }
    images { [Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png')] }
    company { Faker::Company.name }
  end
end

FactoryBot.define do
  factory :mock_product, class: "Product" do
    sequence(:quantity) { |n| n }
    sequence(:color) { |n| "color#{n}" }
    sequence(:name) { |n| "name#{n}" }
    sequence(:price) { |n| n.to_f }
    sequence(:description) { |n| "description#{n}" }
    sequence(:review_count) { |n| n }
    sequence(:total_review_score) { |n| n*5 }
    seller_id { Seller.ids.sample }
    category_id { SubCategory.ids.sample }
  end
end
