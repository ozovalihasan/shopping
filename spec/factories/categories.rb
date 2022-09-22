FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department(max: 1) }
    image { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }
    main_category_id { MainCategory.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_category, class: "Category" do
    sequence(:name) { |n| "name#{n}" }
    main_category_id { MainCategory.ids.sample }

  end
end
