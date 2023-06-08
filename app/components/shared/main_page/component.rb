# frozen_string_literal: true

class Shared::MainPage::Component < Application::Component
  def initialize(main_categories:, products:)
    @main_categories = main_categories
    @products = products
  end
end
