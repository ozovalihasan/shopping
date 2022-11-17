class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :set_product

  # GET /reviews or /reviews.json
  def index
    @reviews = @product.reviews
    respond_to do |format|
      format.html { render Reviews::IndexComponent.new(reviews: @reviews, product: @product) }
      format.json
    end
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    respond_to do |format|
      format.html { render Reviews::ShowComponent.new(review: @review) }
      format.json 
    end
  end

  # GET /reviews/new
  def new
    @review = Review.new
    
    @products = Product.all
    
    @customers = Customer.all
    
    render Reviews::NewComponent.new(review: @review, products: @products, customers: @customers)
  end

  # GET /reviews/1/edit
  def edit
    
    @products = Product.all
    
    @customers = Customer.all
    
    render Reviews::EditComponent.new(review: @review, products: @products, customers: @customers)
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
    
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit()
    end
end