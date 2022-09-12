class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_create :set_price

  def set_price
    self.price = product.price
  end
end
