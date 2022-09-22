FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department(max: 1) }
    image { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }

    trait :primary do
      category_id { nil }
    end

    trait :secondary do
      category_id { Category.primary.ids.sample }
    end
  end
end

FactoryBot.define do
  factory :mock_category, class: "Category" do
    sequence(:name) { |n| "name#{n}" }
    trait :primary do
      category_id { nil }
    end

    trait :secondary do
      category_id { Category.primary.ids.sample }
    end
  end
end
