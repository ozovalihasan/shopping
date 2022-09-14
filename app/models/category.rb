class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :products
  has_many :subcategories, class_name: "Category"
  has_one_attached :image

end
