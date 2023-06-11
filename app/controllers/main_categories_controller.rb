class MainCategoriesController < ApplicationController
  before_action :set_main_category, only: %i[ show ]

  # GET /main_categories or /main_categories.json
  def index
    @main_categories = MainCategory.all
    @products = Product.limit(10).in_random_order.with_discount
    @best_campaign = Campaign.active_now.order_by_discount.limit(1).first
    if @best_campaign
      @products_of_best_deal = @best_campaign.products.with_discount.in_random_order.limit(10)
    end
  end

  # GET /main_categories/1 or /main_categories/1.json
  def show
    page = params[:page] || 1
    @products, @last_page = pagy_products(page: page, products: @main_category.products.with_discount)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_category
      @main_category = MainCategory.find(params[:id])
    end
end