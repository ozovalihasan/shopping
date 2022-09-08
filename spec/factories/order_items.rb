FactoryBot.define do
  factory :order_item do
    price { Faker::Commerce.price }
    quantity { Faker::Number.number(digits: 2) }
    order_id { Order.ids.sample}
    product_id { Product.ids.sample}
  end
end
