class Order < ApplicationRecord
  enum type: {
    'not_completed'=> 0,
    'completed' => 1,
  }, _prefix: true
  
  belongs_to :customer, class_name: "User"
  has_many :addresses
  has_many :order_items
end
