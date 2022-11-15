# frozen_string_literal: true

class MainCategories::ShowComponent < ViewComponent::Base
  def initialize(products:, main_category:, last_page:)
    @products = products
    @main_category = main_category
    @last_page = last_page
  end

end
