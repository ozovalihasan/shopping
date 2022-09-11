# frozen_string_literal: true

class Orders::NewComponent < ViewComponent::Base
  def initialize(order:, customers:)
    @order = order
    
    @customers = customers
    
  end
end
