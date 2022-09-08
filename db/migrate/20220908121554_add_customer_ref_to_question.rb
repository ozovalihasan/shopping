class AddCustomerRefToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :customer, null: false, foreign_key: { to_table: :users }
  end
end
