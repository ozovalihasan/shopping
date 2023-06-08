# frozen_string_literal: true

class Reviews::Form::Component < Application::Component
  def initialize(review:, products:, customers:)
    @review = review
    @products = products
    @customers = customers
  end
end
