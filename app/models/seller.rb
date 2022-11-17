class Seller < User
  has_many :products, foreign_key: "seller_id", dependent: :destroy
  has_many :reviews, through: :products
  has_many :answers, foreign_key: "seller_id", dependent: :destroy
end
