class OrderItemsController < ApplicationController
  include ActionView::RecordIdentifier
  
  before_action :set_order_item, only: %i[ show edit update destroy ]

  # GET /order_items or /order_items.json
  def index
    @order_items = OrderItem.all
    respond_to do |format|
      format.html { render OrderItems::IndexComponent.new(order_items: @order_items) }
      format.json
    end
  end

  # GET /order_items/1 or /order_items/1.json
  def show
    respond_to do |format|
      format.html { render OrderItems::ShowComponent.new(order_item: @order_item) }
      format.json 
    end
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
    
    @orders = Order.all
    
    @products = Product.all
    
    render OrderItems::NewComponent.new(order_item: @order_item, orders: @orders, products: @products)
  end

  # GET /order_items/1/edit
  def edit
    
    @orders = Order.all
    
    @products = Product.all
    
    render OrderItems::EditComponent.new(order_item: @order_item, orders: @orders, products: @products)
  end

  # POST /order_items or /order_items.json
  def create
    @order = @cart
    @order_item = @order.order_items.new(order_item_params)
    @order_item.update(quantity: 1)
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to order_item_url(@order_item), notice: "#{@order_item.product.name} is added to your cart." }
        format.json { render :show, status: :created, location: @order_item }
        format.turbo_stream { 
          render turbo_stream: turbo_stream.prepend(
            "notifications", render_to_string( OrderItems::CreateComponent.new(cart: @cart, order_item: @order_item ))
          ) 
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        @notice = "#{@order_item.product.name} was successfully updated."

        format.html { redirect_to order_item_url(@order_item), notice: @notice }
        format.turbo_stream 
        format.json { render :show, status: :ok, location: @order_item }
      else
        @notice = "The order item is not updated because of an error."
        
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
        format.turbo_stream {
          render turbo_stream: turbo_stream.append(
            "notifications", render_to_string( Notifications::InfoComponent.new(info: @notice) )
          ) 
        }
      end
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy

    respond_to do |format|
      @notice = "OrderItem was successfully destroyed."

      format.html { redirect_to order_items_url, notice: @notice }
      format.turbo_stream 
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id)
    end
end