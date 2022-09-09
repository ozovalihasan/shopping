# frozen_string_literal: true

class Products::ShowComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end

end
