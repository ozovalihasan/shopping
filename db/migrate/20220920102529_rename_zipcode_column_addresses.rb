class RenameZipcodeColumnAddresses < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :zipcode, :postal_code
  end
end
