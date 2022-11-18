class Review < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  after_commit :update_product

  def update_product
    return if product.destroyed?
    
    product.update(
      review_count: product.reviews.count, 
      average_rate: ( product.reviews.average(:rate) || 0).floor(2)
    )
  end
  
end
