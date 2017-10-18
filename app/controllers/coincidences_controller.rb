class CoincidencesController < ApplicationController
  before_action :set_coincidence, only: [:show, :edit, :update, :destroy]

  # GET /coincidences
  # GET /coincidences.json
  def index
    @coincidences = Coincidence.all
  end

  # GET /coincidences/1
  # GET /coincidences/1.json
  def show
  end

  # GET /coincidences/new
  def new
    @coincidence = Coincidence.new
  end

  # GET /coincidences/1/edit
  def edit
  end

  # POST /coincidences
  # POST /coincidences.json
  def create
    @coincidence = Coincidence.new(coincidence_params)

    respond_to do |format|
      if @coincidence.save
        format.html { redirect_to @coincidence, notice: 'Coincidence was successfully created.' }
        format.json { render :show, status: :created, location: @coincidence }
      else
        format.html { render :new }
        format.json { render json: @coincidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coincidences/1
  # PATCH/PUT /coincidences/1.json
  def update
    respond_to do |format|
      if @coincidence.update(coincidence_params)
        format.html { redirect_to @coincidence, notice: 'Coincidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @coincidence }
      else
        format.html { render :edit }
        format.json { render json: @coincidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coincidences/1
  # DELETE /coincidences/1.json
  def destroy
    @coincidence.destroy
    respond_to do |format|
      format.html { redirect_to coincidences_url, notice: 'Coincidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coincidence
      @coincidence = Coincidence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coincidence_params
      params.require(:coincidence).permit(:animal_id, :consideration)
    end
end
