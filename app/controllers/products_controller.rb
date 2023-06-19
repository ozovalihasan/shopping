class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show ]

  # GET /products or /products.json
  def index
    page = params[:page] || 1
    @category = BaseCategory.find(params[:category_id]) unless params[:category_id].blank?
    @products, @last_page, @products_count = pagy_products(page: page, products: Product.search(params[:search_term], params[:category_id], params[:brand_ids]))
    @main_categories = MainCategory.all.includes(:categories)
    @brands = Brand.all
    @search_term = params[:search_term]
    @category_id = params[:category_id]
  end

  # GET /products/1 or /products/1.json
  def show
    @products_from_category = @product.category.products.limit(10)

    respond_to do |format|
      format.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    
end