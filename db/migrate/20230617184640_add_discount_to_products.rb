class AddDiscountToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discount, :integer
    add_index :products, :discount
  end
end
