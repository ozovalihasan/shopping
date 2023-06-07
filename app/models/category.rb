class Category < BaseCategory
  belongs_to :main_category
  has_many :products, dependent: :destroy
end
