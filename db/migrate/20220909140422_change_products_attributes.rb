class ChangeProductsAttributes < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :products, :total_review_score, :integer, using: 'total_review_score::integer'
      change_column :products, :review_count, :integer, using: 'review_count::integer'
    end
  
    def down
      change_column :products, :total_review_score, :string
      change_column :products, :review_count, :string
    end
  end
end
