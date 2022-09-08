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
