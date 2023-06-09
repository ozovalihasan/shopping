class AddProductRefToCampaignItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :campaign_items, :product, null: false, foreign_key: true
  end
end
