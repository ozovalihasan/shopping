# frozen_string_literal: true

class Products::InfiniteScrollStartPage < ViewComponent::Base
  def initialize(products:, last_page:, search_term: nil, category_id: nil)
    @products = products
    @last_page = last_page
    @search_term = search_term
    @category_id = category_id
  end

end
