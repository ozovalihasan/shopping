class Campaign < ApplicationRecord
  has_many :campaign_items
  has_many :products, through: :campaign_items
  has_many :order_items

  has_one_attached :image
  
  scope :active_at, -> ( time) { where("? BETWEEN start_time AND end_time", time) }
  scope :active_now, -> { active_at( Time.now ) }
  scope :order_by_discount, -> { order(discount: :desc) }
end
