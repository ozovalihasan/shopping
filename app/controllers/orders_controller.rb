class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[ index ]
  before_action :set_order, only: %i[ show ]

  # GET /orders or /orders.json
  def index
    @orders = current_user.orders
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
end