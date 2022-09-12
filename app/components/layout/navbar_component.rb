# frozen_string_literal: true

class Layout::NavbarComponent < ViewComponent::Base
  def initialize(cart:, current_user:)
    @cart = cart
    @current_user = current_user
  end

end
