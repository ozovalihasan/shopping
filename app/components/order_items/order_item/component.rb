# frozen_string_literal: true

class OrderItems::OrderItem::Component < Application::Component
  with_collection_parameter :order_item

  def initialize(order_item:)
    @order_item = order_item
  end
end
