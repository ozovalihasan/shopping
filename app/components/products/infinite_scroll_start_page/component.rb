# frozen_string_literal: true

class Products::InfiniteScrollStartPage::Component < Application::Component
  def initialize(products:, last_page:, search_term: nil, category_id: nil, price_order: nil)
    @products = products
    @last_page = last_page
    @search_term = search_term
    @category_id = category_id
    @price_order = price_order
  end

end
