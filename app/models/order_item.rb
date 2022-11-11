class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_create :set_price

  validates :quantity, presence: true, numericality: { only_integer: true,  greater_than: 0 }
  
  def set_price
    self.price = product.price
  end
end
