FactoryBot.define do
  factory :order do
    total_price { Faker::Commerce.price }
    status { [0, 1].sample }
    customer_id { Customer.ids.sample }
  end
end


FactoryBot.define do
  factory :mock_order, class: "Order" do
    sequence(:id) { |n| n }
    sequence(:total_price) { |n| n.to_f }
    customer_id { Customer.ids.sample }

    trait :not_completed do
      status { 0 }
    end

    trait :completed do
      status { 1 }
    end
  end
end
