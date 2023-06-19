class AddIndexToCampaignsStartTimeEndTimeStatus < ActiveRecord::Migration[7.0]
  def change
    add_index :campaigns, :start_time
    add_index :campaigns, :end_time
    add_index :campaigns, :active
  end
end
