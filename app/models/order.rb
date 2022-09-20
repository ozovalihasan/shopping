class Order < ApplicationRecord
  enum status: {
    not_completed: 0,
    completed: 1,
  }, _prefix: true
  
  belongs_to :customer, optional: true, class_name: "User"
  has_one :address
  has_many :order_items
end
