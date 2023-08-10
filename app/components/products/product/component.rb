# frozen_string_literal: true

class Products::Product::Component < Application::Component
  with_collection_parameter :product

  def initialize(product:)
    @product = product
  end

  def having_review?
    @product.review_count > 0
  end

end
