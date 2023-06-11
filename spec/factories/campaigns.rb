
FactoryBot.define do
selected_start_time = nil

  factory :campaign do
    discount { rand(5..20) }
    name { Faker::Lorem.paragraph }
    start_time { selected_start_time = Time.now - 1.years + rand(0..24.months) + rand(0..30.days) + rand(0..24.hours)}
    end_time { selected_start_time + rand(0..24.months) + rand(0..30.days) + rand(0..24.hours) }
    image { Rack::Test::UploadedFile.new("app/assets/images/mock-#{rand(1..5)}.jpg", 'image/png') }
  end
end


FactoryBot.define do
  factory :mock_campaign, class: "CampaignItem" do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "name#{n}" }
    start_time { DateTime.new(2010, 1, 1, 1, 1, 1) }
    end_time { DateTime.new(2020, 1, 1, 1, 1, 1) }
    sequence(:image) {|n| Rack::Test::UploadedFile.new("app/assets/images/mock-#{n % 5 + 1}.jpg", 'image/png') }
  end
end
