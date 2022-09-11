# frozen_string_literal: true

class Orders::IndexComponent < ViewComponent::Base
  def initialize(orders:)
    @orders = orders
  end

end
