# frozen_string_literal: true

class Layout::NavbarComponent < ViewComponent::Base
  def initialize(cart:)
    @cart = cart
  end

end
