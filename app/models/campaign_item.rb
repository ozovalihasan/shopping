class CampaignItem < ApplicationRecord
  belongs_to :campaign
  belongs_to :product
end
