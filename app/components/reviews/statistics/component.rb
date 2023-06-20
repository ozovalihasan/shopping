# frozen_string_literal: true

class Reviews::Statistics::Component < Application::Component
  def initialize(product:, reviews_statistics:)
    @product = product
    @reviews_statistics = reviews_statistics
  end
end
