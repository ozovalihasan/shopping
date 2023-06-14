FactoryBot.define do
  factory :campaign_item do
    campaign_id { Campaign.ids.sample }
    product_id { Product.ids.sample }
  end
end


FactoryBot.define do
  factory :mock_campaign_item, class: "CampaignItem" do
    sequence(:id) { |n| n }
    campaign_id { Campaign.ids.sample }
    product_id { Product.ids.sample }
  end
end
