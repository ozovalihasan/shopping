# frozen_string_literal: true

class Search::CategoriesTree::Component < Application::Component
  def initialize(main_categories:)
    @main_categories = main_categories
  end
end
