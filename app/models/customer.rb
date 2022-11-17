class Customer < User
  has_many :reviews, foreign_key: "customer_id", dependent: :destroy
  has_many :questions, foreign_key: "customer_id", dependent: :destroy
  has_many :orders, foreign_key: "customer_id", dependent: :destroy
  has_many :addresses, through: :orders
end
