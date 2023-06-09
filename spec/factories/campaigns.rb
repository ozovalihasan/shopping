FactoryBot.define do
  selected_start_time = Time.now - 1.years + rand(0..24.months) + rand(0..30.days) + rand(0..24.hours)
  factory :campaign do
    discount { rand(5..20) }
    name { Faker::Lorem.paragraph }
    start_time { selected_start_time }
    end_time { selected_start_time + rand(0..24.months) + rand(0..30.days) + rand(0..24.hours) }
  end
end


FactoryBot.define do
  factory :mock_campaign, class: "CampaignItem" do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "name#{n}" }
    start_time { DateTime.new(2010, 1, 1, 1, 1, 1) }
    end_time { DateTime.new(2020, 1, 1, 1, 1, 1) }
  end
end
