# frozen_string_literal: true

class Questions::EditComponent < ViewComponent::Base
  def initialize(question:, customers:, products:)
    @question = question
    
    @customers = customers
    
    @products = products
    
  end
end
