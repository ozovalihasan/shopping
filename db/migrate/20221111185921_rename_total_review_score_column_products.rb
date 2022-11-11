class RenameTotalReviewScoreColumnProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :total_review_score, :average_rate
  end
end
