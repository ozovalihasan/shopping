FactoryBot.define do
  factory :main_category do
    name { Faker::Commerce.department(max: 1) }
    image { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }
  end
end

FactoryBot.define do
  factory :mock_main_category, class: "MainCategory" do
    id { (BaseCategory.last&.id || 0) + 1 }
    sequence(:image) {|n| Rack::Test::UploadedFile.new("app/assets/images/mock-#{n % 5 + 1}.jpg", 'image/png') }
    sequence(:name) { |n| "main_category_name_#{n}" }
  end
end
