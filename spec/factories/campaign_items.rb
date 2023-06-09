FactoryBot.define do
  factory :campaign_item do
    body { Faker::Lorem.paragraph }
    question_id { Question.ids.sample }
    seller_id { Seller.ids.sample }
  end
end


FactoryBot.define do
  factory :mock_campaign_item, class: "CampaignItem" do
    sequence(:id) { |n| n }
    sequence(:body) { |n| "body#{n}" }
    campaign_id { Campaign.ids.sample }
    product_id { Product.ids.sample }
  end
end
