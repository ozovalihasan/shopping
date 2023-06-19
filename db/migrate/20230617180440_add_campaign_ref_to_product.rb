class AddCampaignRefToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :campaign, foreign_key: true
  end
end
