class Question < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  has_many :answers, dependent: :delete_all
end
