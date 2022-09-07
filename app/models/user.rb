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
  
end
