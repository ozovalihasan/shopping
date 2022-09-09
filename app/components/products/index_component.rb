# frozen_string_literal: true

class Products::IndexComponent < ViewComponent::Base
  def initialize(products:)
    @products = products
  end

end
