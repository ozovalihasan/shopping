class ApplicationController < ActionController::Base
  before_action :set_cart, only: %i[ index show new edit ]

  def set_cart
    @cart = Order.first
  end
end
