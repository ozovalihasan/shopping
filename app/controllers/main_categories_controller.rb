class MainCategoriesController < ApplicationController
  before_action :set_main_category, only: %i[ show ]

  # GET /main_categories or /main_categories.json
  def index
    @main_categories = MainCategory.all
    @products = Product.limit(10).order("RANDOM()")
    respond_to do |format|
      format.turbo_stream      
      format.html
    end
  end

  # GET /main_categories/1 or /main_categories/1.json
  def show
    page = params[:page] || 1
    @products, @last_page = pagy_products(page: page, products: @main_category.products)
    
    respond_to do |format|
      format.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_category
      @main_category = MainCategory.find(params[:id])
    end
end