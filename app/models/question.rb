class Question < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  has_many :answers, dependent: :destroy

  scope :by_sorting, -> (selection) {
    case selection 
    when "oldest"
      order(created_at: :asc)
    when "newest"
      order(created_at: :desc)
    else
      nil
    end
  }
end
