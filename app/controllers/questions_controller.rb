class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]


#ordenar preguntas
  def orderQuestions
    @orde = Question.order(:order)
    respond_to do |format|
    format.html 
    format.json { render json: @order }
    end
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    #se agrega una pregunta ordenamente
    @question = Question.new(question_params)
    order = Question.order(:order)

    unless order.include?(@question.order)
      o = Question.where(order: @question.order..order.length).select(:order,:id)
      o.each do |q|
        Question.where(id: q.id).update(order: q.order + 1)
      end
    end

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
      #se intercambian los valores del orden cuando se edita el orden de una pregunta
      o = Question.where(order: question_params[:order]).update(order: @question.order)
    

    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :order, :typeans, :active)
    end
end
