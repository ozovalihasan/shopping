class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories/1 or /categories/1.json
  def show
    page = params[:page] || 1
    @products, @last_page = pagy_products(page: page, products: @category.products)
    
    respond_to do |format|
      format.html 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

end
