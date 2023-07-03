class Seller < User
  validates :username, presence: true

  has_many :products, dependent: :destroy
  has_many :reviews, through: :products
  has_many :answers, foreign_key: "seller_id", dependent: :destroy
end
