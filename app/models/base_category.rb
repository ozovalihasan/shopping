class BaseCategory < ApplicationRecord
  has_one_attached :image

  enum type: {
    'MainCategory' => 0,
    'Category' => 1,
  }
end
