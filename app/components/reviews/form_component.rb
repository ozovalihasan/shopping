# frozen_string_literal: true

class Reviews::FormComponent < ViewComponent::Base
  def initialize(review:, products:, customers:)
    @review = review
    @products = products
    @customers = customers
  end
end
