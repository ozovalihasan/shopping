# frozen_string_literal: true

class Categories::ShowComponent < ViewComponent::Base
  def initialize(products:, category:, last_page:)
    @products = products
    @category = category
    @last_page = last_page
  end

end
