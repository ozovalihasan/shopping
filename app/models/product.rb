class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category
  belongs_to :brand
  belongs_to :applied_campaign, optional: true, class_name: "Campaign"
  
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :campaign_items
  has_many :campaigns, through: :campaign_items
  has_many :active_campaigns_now, -> { active_now }, through: :campaign_items, source: :campaign
  
  has_many_attached :images

  default_scope do
    CheckProductsWithCampaigns.call
    nil
  end

  scope :of_brands, -> (brand_ids) do
    return nil if brand_ids.blank?
      
    return where(brand_id: brand_ids)
  end

  scope :of_category, -> (category_id) do
    if category_id && category_id != ""
      category = BaseCategory.find(category_id)
      category.products
    else
      nil
    end
  end
  
  scope :with_term, -> (search_term) { where('products.name ILIKE ?', "%#{search_term}%") }

  scope :search, ->(search_term, category_id = nil, brand_ids = [], price_order = nil) do 
    with_term(search_term).of_category(category_id).of_brands(brand_ids).order_in_price(price_order)
  end

  scope :order_in_price, -> (selection) {
    case selection 
    when "highest_price"
      descending_price
    when "lowest_price"
      ascending_price
    when "highest_review_rate"
      highest_review_rate
    when "highest_discount"
      highest_discount
    else
      nil
    end
  }

  scope :descending_price, -> { order(discount_price: :desc ) }
  scope :ascending_price, -> { order(discount_price: :asc ) }
  scope :highest_review_rate, -> { order(average_rate: :desc ) }
  scope :highest_discount, -> { order(discount: :desc ) }

  scope :in_random_order, -> { order("RANDOM()") }
end
