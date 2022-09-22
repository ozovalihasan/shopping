# frozen_string_literal: true

class MainCategories::MainCategoryComponent < ViewComponent::Base
  def initialize(main_category:)
    @main_category = main_category
  end
end
