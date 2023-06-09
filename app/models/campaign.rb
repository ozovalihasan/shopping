class Campaign < ApplicationRecord
  has_many :campaign_items
  has_many :order_items

  scope :active_at, -> ( time) { where("? BETWEEN start_time AND end_time", time) }
  scope :active_now, -> { active_at( Time.now ) }
  scope :most_profitable_now, -> { active_now.order(discount: :asc).limit(1) }
end
