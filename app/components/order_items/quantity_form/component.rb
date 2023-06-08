# frozen_string_literal: true

class OrderItems::QuantityForm::Component < Application::Component
  def initialize(order_item:)
    @order_item = order_item
  end

end
