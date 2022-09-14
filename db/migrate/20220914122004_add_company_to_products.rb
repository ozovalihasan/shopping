class AddCompanyToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :company, :string
  end
end
