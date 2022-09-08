class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: {
    'Customer' => 0,
    'Seller'=> 1,
    'Admin' => 2
  }, _prefix: true
  
  has_many :products, foreign_key: "seller_id"
  has_many :reviews, through: :products
  has_many :customers, through: :products
  has_many :reviews, foreign_key: "customer_id"
  has_many :answers, foreign_key: "seller_id"
  has_many :questions, foreign_key: "customer_id"
  has_many :orders, foreign_key: "customer_id"
end
