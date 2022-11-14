class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index

    page = params[:page] || 1
    @pagy, @products = pagy(Product.search(params[:search_term], params[:category_id]), page: page)
    last_page = @pagy.last
    
    respond_to do |format|
      format.turbo_stream 
      format.html { render Products::IndexComponent.new(
        products: @products, 
        last_page: last_page, 
        search_term: params[:search_term],
        category_id: params[:category_id]
      )}
      format.json
    end
  end

  # GET /products/1 or /products/1.json
  def show
    respond_to do |format|
      format.html { render Products::ShowComponent.new(product: @product) }
      format.json 
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @sellers = Seller.all
    @categories = Category.all
    render Products::NewComponent.new(product: @product, categories: @categories, sellers: @sellers)
  end

  # GET /products/1/edit
  def edit
    @sellers = Seller.all
    @categories = Category.all
    render Products::EditComponent.new(product: @product, categories: @categories, sellers: @sellers)
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @products = Product.search(params[:search_term]).includes(:reviews)
    respond_to do |format|
      format.turbo_stream 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:color, :description, :quantity, :price, :name, :seller_id, :category_id, images: [])
    end
end