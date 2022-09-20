class RenameBodyColumnAddresses < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :body, :name
  end
end
