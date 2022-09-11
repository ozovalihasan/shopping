# frozen_string_literal: true

class Reviews::NewComponent < ViewComponent::Base
  def initialize(review:, products:, customers:)
    @review = review
    
    @products = products
    
    @customers = customers
    
  end
end
