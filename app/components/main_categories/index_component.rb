# frozen_string_literal: true

class MainCategories::IndexComponent < ViewComponent::Base
  def initialize(main_categories:, products:)
    @main_categories = main_categories
    @products = products
  end

end
