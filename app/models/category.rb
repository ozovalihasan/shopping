class Category < ApplicationRecord
  has_one_attached :image

  enum type: {
    'MainCategory' => 0,
    'SubCategory' => 1,
  }
end
