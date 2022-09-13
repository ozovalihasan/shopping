class Seller < User
  has_many :products, foreign_key: "seller_id"
  has_many :reviews, through: :products
  has_many :customers, through: :products
  has_many :answers, foreign_key: "seller_id"
end
