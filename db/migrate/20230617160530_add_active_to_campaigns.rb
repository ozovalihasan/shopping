class AddActiveToCampaigns < ActiveRecord::Migration[7.0]
  def change
    add_column :campaigns, :active, :boolean, default: false
  end
end
