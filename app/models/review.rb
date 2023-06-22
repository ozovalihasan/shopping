class Review < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  after_commit :update_product

  scope :group_by_rates, -> do
    group(:rate).select("reviews.rate, COUNT(*) AS count").order(:rate)
  end


  scope :order_in_rate, -> (selection) {
    case selection 
    when "highest_rate"
      descending_rate
    when "lowest_rate"
      ascending_rate
    else
      nil
    end
  }

  scope :descending_rate, -> { order(rate: :desc ) }
  scope :ascending_rate, -> { order(rate: :asc ) }
  
  def update_product
    return if product.destroyed?
    
    product.update(
      review_count: product.reviews.count, 
      average_rate: ( product.reviews.average(:rate) || 0).floor(2)
    )
  end
  
end
