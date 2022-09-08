class AddOrderRefToAddress < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :order, null: false, foreign_key: true
  end
end
