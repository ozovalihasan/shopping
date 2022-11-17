class MainCategory < BaseCategory
  has_many :categories, dependent: :destroy
  has_many :products, through: :categories
end
