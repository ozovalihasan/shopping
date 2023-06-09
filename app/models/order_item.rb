class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :campaign, optional: true

  before_create :set_price
  after_save :update_order

  validates :quantity, presence: true, numericality: { only_integer: true,  greater_than: 0 }
  
  def update_order
    order.update_total_price
  end
  
  def set_price
    self.price = product.price
  end
end
