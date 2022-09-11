# frozen_string_literal: true

class Orders::OrderComponent < ViewComponent::Base
  def initialize(order:)
    @order = order
  end
end
