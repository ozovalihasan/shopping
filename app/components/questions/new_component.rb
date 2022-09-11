# frozen_string_literal: true

class Questions::NewComponent < ViewComponent::Base
  def initialize(question:, customers:, products:)
    @question = question
    
    @customers = customers
    
    @products = products
    
  end
end
