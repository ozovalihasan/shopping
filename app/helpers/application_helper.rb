module ApplicationHelper
  include Pagy::Frontend
  
  def current_order
    order = Order.find_by id: session[:order_id]
    
    if order
      if (order.customer && (order.customer != current_customer)) || order.status_completed?
        order = Order.create(status: 0, total_price: 0.0)  
        session[:order_id] = order.id
      end
      if order.customer.nil? && customer_signed_in?
        order.update_attribute :customer, current_customer
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

  def pagy_products(page:, products:)
    pagy, limited_products = pagy(products, page: page)
    last_page = pagy.last

    return [ limited_products, last_page ]
  end

  def main_parts_target
    "main-parts"
  end
  
  def component(name, *args, **kwargs, &)
    name.to_s.camelize.constantize::Component.new(*args, **kwargs, &)
  end

  def components(name, *args, **kwargs, &)
    name.to_s.camelize.constantize::Component.with_collection(*args, **kwargs, &)
  end

end
