class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category
  
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :campaign_items
  has_many :campaigns, through: :campaign_items
  has_many :active_campaigns_now, -> { active_now }, through: :campaign_items, source: :campaign
  
  has_many_attached :images

  scope :search, ->(search_term, category_id = nil) do 
    if category_id && category_id != ""
      return where('category_id = ? AND name ILIKE ?', category_id, "%#{search_term}%") 
    else
      return where('name ILIKE ?', "%#{search_term}%") 
    end
  end

  scope :with_discount, -> {
    select("products.*, MAX(campaigns.discount) as discount")
    .left_outer_joins(:active_campaigns_now)
    .group( Product.arel_table[:id] )
  }

  scope :in_random_order, -> { order("RANDOM()") }
  
end
