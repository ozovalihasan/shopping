class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :products
  has_many :subcategories, class_name: "Category"
  has_one_attached :image

  scope :primary, -> { where(category_id: nil) }
  scope :secondary, -> { where.not(category_id: nil) }
end
