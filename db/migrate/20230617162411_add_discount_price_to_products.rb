class AddDiscountPriceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discount_price, :decimal
    add_index :products, :discount_price
  end
end
