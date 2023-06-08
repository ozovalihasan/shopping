# frozen_string_literal: true

class Products::SearchBar::Component < Application::Component
  def initialize(categories:)
    @categories = categories
  end
end
