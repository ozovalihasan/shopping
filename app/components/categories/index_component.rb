# frozen_string_literal: true

class Categories::IndexComponent < ViewComponent::Base
  def initialize(categories:, products:)
    @categories = categories
    @products = products
  end

end
