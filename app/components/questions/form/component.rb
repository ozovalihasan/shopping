# frozen_string_literal: true

class Questions::Form::Component < Application::Component
  def initialize(question:, customers:, products:)
    @question = question
    @customers = customers
    @products = products
  end
end
