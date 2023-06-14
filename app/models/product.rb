class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category
  belongs_to :brand
  
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :campaign_items
  has_many :campaigns, through: :campaign_items
  has_many :active_campaigns_now, -> { active_now }, through: :campaign_items, source: :campaign
  
  has_many_attached :images

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

  scope :search, ->(search_term, category_id = nil, brand_ids = []) do 
    with_term(search_term).of_category(category_id).of_brands(brand_ids).with_discount
  end

  scope :with_discount, -> {
    select("products.*, MAX(campaigns.discount) as discount")
    .left_outer_joins(:active_campaigns_now)
    .group( Product.arel_table[:id] )
  }

  scope :in_random_order, -> { order("RANDOM()") }
  
end
