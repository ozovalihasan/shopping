class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
    respond_to do |format|
      format.html { render Answers::IndexComponent.new(answers: @answers) }
      format.json
    end
  end

  # GET /answers/1 or /answers/1.json
  def show
    respond_to do |format|
      format.html { render Answers::ShowComponent.new(answer: @answer) }
      format.json 
    end
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    
    @questions = Question.all
    
    @sellers = Seller.all
    
    render Answers::NewComponent.new(answer: @answer, questions: @questions, sellers: @sellers)
  end

  # GET /answers/1/edit
  def edit
    
    @questions = Question.all
    
    @sellers = Seller.all
    
    render Answers::EditComponent.new(answer: @answer, questions: @questions, sellers: @sellers)
  end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit()
    end
end