class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.integer :discount
      t.text :name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
