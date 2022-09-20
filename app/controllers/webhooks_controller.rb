class WebhooksController < ApplicationController
  skip_before_action :set_cart, only: [:create]
  # protect_from_forgery except: :webhooks
  skip_before_action :verify_authenticity_token
  before_action :authenticate_customer!, only: [:new]
    
  def new
    order_items = @cart.order_items.map do |order_item|
      {
        name: order_item.product.name,
        amount: (order_item.product.price * 100).to_i,
        currency: "usd",
        quantity: order_item.quantity
      }
    end
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [
        order_items
      ],
      mode: 'payment',
      metadata: {
        order_id: @cart.id
      },
      success_url: categories_url,
      cancel_url: categories_url,
    })
    
    redirect_to session.url, allow_other_host: true
    
  end
  
  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
        event = Stripe::Webhook.construct_event(
            payload, sig_header, Figaro.env.stripe_webhook_secret_key
        )
    rescue JSON::ParserError => e
        # Invalid payload
        status 400
        return
    rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        status 400
        return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      checkout_session = event.data.object
      if checkout_session.payment_status == "paid"
        Order.find(checkout_session["metadata"]["order_id"]).update status: 1
      end
    else
        puts "Unhandled event type: #{event.type}"
    end

    render :nothing => true, :status => 200
  end
end
