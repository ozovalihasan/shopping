# frozen_string_literal: true

class OrderItems::NewComponent < ViewComponent::Base
  def initialize(order_item:, orders:, products:)
    @order_item = order_item
    
    @orders = orders
    
    @products = products
    
  end
end
