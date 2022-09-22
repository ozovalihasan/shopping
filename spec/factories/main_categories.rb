FactoryBot.define do
  factory :main_category do
    name { Faker::Commerce.department(max: 1) }
    image { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }
  end
end

FactoryBot.define do
  factory :mock_main_category, class: "Category" do
    sequence(:name) { |n| "name#{n}" }
  end
end
