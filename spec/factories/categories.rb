FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department(max: 1) }
    category_id { Category.all.size < 4 ? nil : Category.ids.sample}
  end
end

FactoryBot.define do
  factory :mock_category, class: "Category" do
    sequence(:name) { |n| "name#{n}" }
    category_id { Category.all.size < 4 ? nil : Category.ids.sample}
  end
end
