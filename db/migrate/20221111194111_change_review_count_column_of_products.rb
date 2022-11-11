class ChangeReviewCountColumnOfProducts < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :review_count, :integer, using: 'review_count::integer'
  end

  def down
    change_column :products, :review_count, :string
  end
end
