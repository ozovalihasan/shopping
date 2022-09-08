class AddSellerRefToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :seller, null: false, foreign_key: { to_table: :users }
  end
end
