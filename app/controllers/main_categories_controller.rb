class MainCategoriesController < ApplicationController
  before_action :set_main_category, only: %i[ show edit update destroy ]

  # GET /main_categories or /main_categories.json
  def index
    @main_categories = MainCategory.all
    @products = Product.limit(10).order("RANDOM()")
    respond_to do |format|
      format.turbo_stream      
      format.html
      format.json
    end
  end

  # GET /main_categories/1 or /main_categories/1.json
  def show
    page = params[:page] || 1
    @pagy, @products = pagy(@main_category.products, page: page)
    last_page = @pagy.last
    
    respond_to do |format|
      format.html
      format.json 
    end
  end

  # GET /main_categories/new
  def new
    @main_category = MainCategory.new
    
    render MainCategories::NewComponent.new(main_category: @main_category)
  end

  # GET /main_categories/1/edit
  def edit
    
    render MainCategories::EditComponent.new(main_category: @main_category)
  end

  # POST /main_categories or /main_categories.json
  def create
    @main_category = MainCategory.new(main_category_params)

    respond_to do |format|
      if @main_category.save
        format.html { redirect_to main_category_url(@main_category), notice: "MainCategory was successfully created." }
        format.json { render :show, status: :created, location: @main_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @main_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_categories/1 or /main_categories/1.json
  def update
    respond_to do |format|
      if @main_category.update(main_category_params)
        format.html { redirect_to main_category_url(@main_category), notice: "MainCategory was successfully updated." }
        format.json { render :show, status: :ok, location: @main_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @main_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_categories/1 or /main_categories/1.json
  def destroy
    @main_category.destroy

    respond_to do |format|
      format.html { redirect_to main_categories_url, notice: "MainCategory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_category
      @main_category = MainCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_category_params
      params.require(:main_category).permit()
    end
end