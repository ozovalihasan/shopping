# frozen_string_literal: true

class Carts::NavbarComponent < ViewComponent::Base
  def initialize(cart:)
    @cart = cart
  end
end
