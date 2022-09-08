class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :seller, class_name: "User"
end
