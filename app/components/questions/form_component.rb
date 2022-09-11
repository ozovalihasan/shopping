# frozen_string_literal: true

class Questions::FormComponent < ViewComponent::Base
  def initialize(question:, customers:, products:)
    @question = question
    @customers = customers
    @products = products
  end
end
