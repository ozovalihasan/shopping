# frozen_string_literal: true

class Orders::Form::Component < Application::Component
  def initialize(order:, customers:)
    @order = order
    @customers = customers
  end
end
