module ApplicationHelper
  def current_order
    order = Order.find_by id: session[:order_id]
    
    if order
      if order.customer && (order.customer != current_customer)
        order = Order.create(status: 0, total_price: 0.0)  
        session[:order_id] = order.id
      end
    else
      order = Order.create(status: 0, total_price: 0.0)
      session[:order_id] = order.id
    end
    order
  end

  def set_cart
    return if seller_signed_in? || admin_signed_in?
    @cart = current_order
  end

  def signed_in_user?
    seller_signed_in? || customer_signed_in? || admin_signed_in?
  end

  def current_user
    current_customer || current_seller || current_admin
  end
end
