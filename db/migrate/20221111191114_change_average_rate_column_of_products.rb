class ChangeAverageRateColumnOfProducts < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :average_rate, :decimal, precision: 3, scale: 2, using: 'average_rate::numeric(3,2)'
  end

  def down
    change_column :products, :average_rate, :string
  end
end
