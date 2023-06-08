# frozen_string_literal: true

class Products::InfiniteScroll::Component < Application::Component
  def initialize(products:)
    @products = products
  end
end
