class RenameCategoriesToBaseCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories, :base_categories
  end
end
