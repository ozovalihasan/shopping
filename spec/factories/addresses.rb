FactoryBot.define do
  factory :address do
    body { Faker::Address.full_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    zipcode { Faker::Number.number(digits: 5) }
    order_id { Order.ids.sample }
  end
end

FactoryBot.define do
  factory :mock_address, class: "Address" do
    sequence(:body) { |n| "body#{n}" }
    sequence(:city) { |n| "city#{n}" }
    sequence(:state) { |n| "state#{n}" }
    sequence(:country) { |n| "country#{n}" }
    sequence(:zipcode) { |n| n }
    order_id { Order.ids.sample }
  end
end
