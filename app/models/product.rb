class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category
  has_many :order_items, dependent: :delete_all
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :delete_all
  has_many :questions, dependent: :delete_all

  has_many_attached :images

  scope :search, ->(search_term) { where('name ILIKE ?', "%#{search_term}%")}
end
