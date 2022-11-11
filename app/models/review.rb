class Review < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  after_commit :update_product

  def update_product
    product.update(review_count: product.reviews.count, total_review_score: product.reviews.sum(:rate))
  end
  
end
