# frozen_string_literal: true

class OrderItems::CreateComponent < ViewComponent::Base
  def initialize(order_item:, cart:)
    @order_item = order_item
    
    @cart = cart
  end
end
