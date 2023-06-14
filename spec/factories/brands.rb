FactoryBot.define do
  factory :brand do
    name { Faker::Company.name }
    image { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }
  end
end

FactoryBot.define do
  factory :mock_brand, class: "Brand" do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "brand_name_#{n}" }
    sequence(:image) {|n| Rack::Test::UploadedFile.new("app/assets/images/mock-#{n % 5 + 1}.jpg", 'image/png') }
  end
end
