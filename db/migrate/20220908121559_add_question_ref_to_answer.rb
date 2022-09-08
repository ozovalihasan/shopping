class AddQuestionRefToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :question, null: false, foreign_key: true
  end
end
