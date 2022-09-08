class Question < ApplicationRecord
  belongs_to :customer, class_name: "User"
  belongs_to :product
  has_many :answers
end
