# frozen_string_literal: true

class Products::InfiniteScrollComponent < ViewComponent::Base
  def initialize(products:)
    @products = products
  end
end
