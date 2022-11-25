class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show ]

  # GET /products or /products.json
  def index

    page = params[:page] || 1
    @products, @last_page = pagy_products(page: page, products: Product.search(params[:search_term], params[:category_id]))
    
    respond_to do |format|
      format.turbo_stream 
      format.html 
    end
  end

  # GET /products/1 or /products/1.json
  def show
    respond_to do |format|
      format.html { render Products::ShowComponent.new(product: @product) }
      format.json 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    
end