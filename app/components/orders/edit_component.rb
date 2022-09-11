# frozen_string_literal: true

class Orders::EditComponent < ViewComponent::Base
  def initialize(order:, customers:)
    @order = order
    
    @customers = customers
    
  end
end
