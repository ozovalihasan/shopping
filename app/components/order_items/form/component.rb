# frozen_string_literal: true

class OrderItems::Form::Component < Application::Component
  def initialize(order_item:, orders:, products:)
    @order_item = order_item
    @orders = orders
    @products = products
  end
end
