class CreateCampaignItems < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_items do |t|

      t.timestamps
    end
  end
end
