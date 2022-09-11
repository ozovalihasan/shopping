# frozen_string_literal: true

class Orders::ShowComponent < ViewComponent::Base
  def initialize(order:)
    @order = order
  end

end
