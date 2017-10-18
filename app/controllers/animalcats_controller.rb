class AnimalcatsController < ApplicationController
  before_action :set_animalcat, only: [:show, :edit, :update, :destroy, :showAnimalsCat]
  skip_before_action :verify_authenticity_token

  ## GET /animalcats/:id/showAnimalsCat.json
  def showAnimalsCat
    @animals_from_cat = Animal.select("animals.id,animals.name").where("animals.animalcat_id = ? ", @animalcat)
    respond_to do |format|
      #format.html
      format.json { render json: @animals_from_cat }
    end
  end

  # GET /animalcats
  # GET /animalcats.json
  def index
    @animalcats = Animalcat.all
  end

  # GET /animalcats/1
  # GET /animalcats/1.json
  def show
  end

  # GET /animalcats/new
  def new
    @animalcat = Animalcat.new
  end

  # GET /animalcats/1/edit
  def edit
  end

  # POST /animalcats
  # POST /animalcats.json
  def create
    @animalcat = Animalcat.new(animalcat_params)

    respond_to do |format|
      if @animalcat.save
        format.html { redirect_to @animalcat, notice: 'Animalcat was successfully created.' }
        format.json { render :show, status: :created, location: @animalcat }
      else
        format.html { render :new }
        format.json { render json: @animalcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animalcats/1
  # PATCH/PUT /animalcats/1.json
  def update
    respond_to do |format|
      if @animalcat.update(animalcat_params)
        format.html { redirect_to @animalcat, notice: 'Animalcat was successfully updated.' }
        format.json { render :show, status: :ok, location: @animalcat }
      else
        format.html { render :edit }
        format.json { render json: @animalcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animalcats/1
  # DELETE /animalcats/1.json
  def destroy
    @animalcat.destroy
    respond_to do |format|
      format.html { redirect_to animalcats_url, notice: 'Animalcat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animalcat
      @animalcat = Animalcat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animalcat_params
      params.require(:animalcat).permit(:name, :video, :active)
    end
end
