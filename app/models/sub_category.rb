class SubCategory < Category
  belongs_to :main_category, foreign_key: "category_id"
  has_many :products, foreign_key: "category_id"
end
