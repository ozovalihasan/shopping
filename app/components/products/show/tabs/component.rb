# frozen_string_literal: true

class Products::Show::Tabs::Component < Application::Component
  def initialize(product:)
    @product = product
  end
end
