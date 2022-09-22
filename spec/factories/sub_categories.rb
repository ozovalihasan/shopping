FactoryBot.define do
  factory :sub_category do
    name { Faker::Commerce.department(max: 1) }
    image { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }
    category_id { MainCategory.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_sub_category, class: "Category" do
    sequence(:name) { |n| "name#{n}" }
    category_id { MainCategory.ids.sample }

  end
end
