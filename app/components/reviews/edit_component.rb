# frozen_string_literal: true

class Reviews::EditComponent < ViewComponent::Base
  def initialize(review:, products:, customers:)
    @review = review
    
    @products = products
    
    @customers = customers
    
  end
end
