FactoryBot.define do
  factory :product do
    color { Faker::Color.color_name }
    quantity { Faker::Number.number(digits: 2) }
    description { Faker::Lorem.paragraph }
    name { Faker::Commerce.product_name }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    review_count { 0 }
    average_rate { 0 }
    brand_id { Brand.ids.sample }
    seller_id { Seller.ids.sample }
    category_id { Category.ids.sample }
    images { [Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png')] }
  end
end

FactoryBot.define do
  factory :mock_product, class: "Product" do
    sequence(:id) { |n| n }
    sequence(:quantity) { |n| n }
    sequence(:color) { |n| "color#{n}" }
    sequence(:name) { |n| "product_name_#{n}" }
    sequence(:price) { |n| n.to_f }
    sequence(:description) { |n| "description#{n}" }
    sequence(:review_count) { |n| n }
    sequence(:average_rate) { |n| n % 5  }
    sequence(:brand_id) { |n| Brand.first.id + n - 1 }
    seller_id { Seller.ids.sample }
    category_id { Category.ids.sample }
  end
end
