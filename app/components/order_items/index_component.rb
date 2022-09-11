# frozen_string_literal: true

class OrderItems::IndexComponent < ViewComponent::Base
  def initialize(order_items:)
    @order_items = order_items
  end

end
