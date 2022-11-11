class Order < ApplicationRecord
  enum status: {
    not_completed: 0,
    completed: 1,
  }, _prefix: true
  
  belongs_to :customer, optional: true
  has_one :address, dependent: :destroy
  has_many :order_items, dependent: :destroy

  def update_total_price
    self.update(total_price: self.order_items.sum {|order_item| order_item.product.price * order_item.quantity})
  end
  
end
