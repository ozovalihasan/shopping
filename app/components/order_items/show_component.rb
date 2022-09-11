# frozen_string_literal: true

class OrderItems::ShowComponent < ViewComponent::Base
  def initialize(order_item:)
    @order_item = order_item
  end

end
