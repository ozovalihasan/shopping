class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :color
      t.text :description
      t.integer :quality
      t.decimal :price
      t.string :review_count
      t.string :total_review_score

      t.timestamps
    end
  end
end
