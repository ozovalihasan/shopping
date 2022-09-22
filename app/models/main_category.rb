class MainCategory < Category
  has_many :sub_categories, foreign_key: 'category_id'
  has_many :products, through: :sub_categories
end
