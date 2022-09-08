class ChangeOrdersStatus < ActiveRecord::Migration[7.0]
  def up
    change_column :orders, :status, :integer, using: 'status::integer'
  end

  def down
    change_column :orders, :status, :string
  end
end
