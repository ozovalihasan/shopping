class Customer < User
  has_many :reviews, foreign_key: "customer_id"
  has_many :questions, foreign_key: "customer_id"
  has_many :orders, foreign_key: "customer_id"
end
