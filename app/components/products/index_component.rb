# frozen_string_literal: true

class Products::IndexComponent < ViewComponent::Base
  def initialize(products:, last_page:, search_term:, category_id:)
    @products = products
    @last_page = last_page
    @search_term = search_term
    @category_id = category_id
  end

end
