class AddLinesToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :line1, :text
    add_column :addresses, :line2, :text
  end
end
