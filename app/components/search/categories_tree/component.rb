# frozen_string_literal: true

class Search::CategoriesTree::Component < Application::Component
  def initialize(main_categories:, category_id:, form:)
    @main_categories = main_categories
    @category_id = category_id
    @form = form
  end
end
