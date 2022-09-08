class Order < ApplicationRecord
  belongs_to :customer, class_name: "User"
  has_many :addresses
  has_many :order_items
end
