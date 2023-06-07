class Customer < User
  has_many :reviews, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, through: :orders
end
