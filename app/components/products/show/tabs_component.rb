# frozen_string_literal: true

class Products::Show::TabsComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end
end
