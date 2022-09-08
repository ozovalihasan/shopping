class RenameQualityColumnProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :quality, :quantity
  end
end
