class SubCategory < Category
  belongs_to :main_category
  has_many :products, foreign_key: "category_id"
end
