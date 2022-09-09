FactoryBot.define do
  factory :order_item do
    price { Faker::Commerce.price }
    quantity { Faker::Number.number(digits: 2) }
    order_id { Order.ids.sample}
    product_id { Product.ids.sample}
  end
end

FactoryBot.define do
  factory :mock_order_item, class: "OrderItem" do
    sequence(:price) { |n| n.to_f }
    sequence(:quantity) { |n| n }
    order_id { Order.ids.sample}
    product_id { Product.ids.sample}
  end
end
