class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews
  has_many :questions

  has_many_attached :images
end
