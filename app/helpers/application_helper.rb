module ApplicationHelper
  def current_order
    order = Order.find_by id: session[:order_id]
    
    unless order
      order = Order.create(status: 0, total_price: 0.0)
      session[:order_id] = order.id
    end
    order
  end

  def set_cart
    @cart = current_order
  end
end
