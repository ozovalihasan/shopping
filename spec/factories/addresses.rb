FactoryBot.define do
  factory :address do
    name { Faker::Address.full_address }
    city { Faker::Address.city }
    line1 { Faker::Address.street_name }
    line2 { Faker::Address.street_address }
    state { Faker::Address.state }
    country { Faker::Address.country }
    postal_code { Faker::Number.number(digits: 5) }
    order_id { Order.where.missing(:address).ids.sample }
  end
end

FactoryBot.define do
  factory :mock_address, class: "Address" do
    sequence(:name) { |n| "name#{n}" }
    sequence(:city) { |n| "city#{n}" }
    sequence(:line1) {|n| "line1-#{n}" }
    sequence(:line2) {|n| "line2-#{n}" }
    sequence(:state) { |n| "state#{n}" }
    sequence(:country) { |n| "country#{n}" }
    sequence(:postal_code) { |n| n }
    order_id { Order.ids.sample }
  end
end
