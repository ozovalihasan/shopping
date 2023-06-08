# frozen_string_literal: true

class Orders::Order::Component < Application::Component
  with_collection_parameter :order
  
  def initialize(order:)
    @order = order
  end
end
