FactoryBot.define do
  factory :order do
    total_price { Faker::Commerce.price }
    status { [0, 1].sample }
    customer_id { Customer.ids.sample }
  end
end
