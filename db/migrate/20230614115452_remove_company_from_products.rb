class RemoveCompanyFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :company, :string
  end
end
