# frozen_string_literal: true

class OrderItems::OrderItemComponent < ViewComponent::Base
  def initialize(order_item:)
    @order_item = order_item
  end
end
