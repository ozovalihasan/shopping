class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_product


  # GET /questions or /questions.json
  def index
    @questions = @product.questions
    respond_to do |format|
      format.html { render Questions::IndexComponent.new(questions: @questions, product: @product) }
      format.json
    end
  end

  # GET /questions/1 or /questions/1.json
  def show
    respond_to do |format|
      format.html { render Questions::ShowComponent.new(question: @question) }
      format.json 
    end
  end

  # GET /questions/new
  def new
    @question = Question.new
    
    @customers = Customer.all
    
    @products = Product.all
    
    render Questions::NewComponent.new(question: @question, customers: @customers, products: @products)
  end

  # GET /questions/1/edit
  def edit
    
    @customers = Customer.all
    
    @products = Product.all
    
    render Questions::EditComponent.new(question: @question, customers: @customers, products: @products)
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
    
    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit()
    end
end