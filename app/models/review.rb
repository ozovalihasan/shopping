class Review < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  after_commit :update_product

  def update_product
    product.update(
      review_count: product.reviews.count, 
      average_rate: ( product.reviews.average(:rate)).floor(2)
    )
  end
  
end
