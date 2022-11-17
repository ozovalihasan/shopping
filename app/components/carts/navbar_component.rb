# frozen_string_literal: true

class Carts::NavbarComponent < ViewComponent::Base
  def initialize(cart:)
    @cart = cart
  end

  def cart_empty?
    @cart.order_items.empty?
  end

  def cart_total_quantity
    @cart.order_items.sum(&:quantity)
  end
end
