# frozen_string_literal: true

class Products::EditComponent < ViewComponent::Base
  def initialize(product:, sellers:, categories:)
    @product = product
    @sellers = sellers
    @categories = categories
  end
end
