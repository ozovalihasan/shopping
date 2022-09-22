class RenameCategoryIdColumnCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :category_id, :main_category_id
  end
end
