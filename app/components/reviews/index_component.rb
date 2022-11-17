# frozen_string_literal: true

class Reviews::IndexComponent < ViewComponent::Base
  def initialize(reviews:, product:)
    @reviews = reviews
    @product = product
  end

end
