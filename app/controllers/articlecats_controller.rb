class ArticlecatsController < ApplicationController
  before_action :set_articlecat, only: [:show, :edit, :update, :destroy, :showArticlesCat]

 #skip_before_action :verify_authenticity_token

  ## GET /animalcats/:id/showArticlesCat.json
  def showArticlesCat
    @articles_from_cat = Article.select("articles.id,articles.name").where("articles.articlecat_id = ? ", @articlecat)
    respond_to do |format|
      #format.html
      format.json { render json: @articles_from_cat }
    end
  end

  # GET /articlecats
  # GET /articlecats.json
  def index
    @articlecats = Articlecat.all
  end

  # GET /articlecats/1
  # GET /articlecats/1.json
  def show
  end

  # GET /articlecats/new
  def new
    @articlecat = Articlecat.new
  end

  # GET /articlecats/1/edit
  def edit
  end

  # POST /articlecats
  # POST /articlecats.json
  def create
    @articlecat = Articlecat.new(articlecat_params)

    respond_to do |format|
      if @articlecat.save
        format.html { redirect_to @articlecat, notice: 'Articlecat was successfully created.' }
        format.json { render :show, status: :created, location: @articlecat }
      else
        format.html { render :new }
        format.json { render json: @articlecat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articlecats/1
  # PATCH/PUT /articlecats/1.json
  def update
    respond_to do |format|
      if @articlecat.update(articlecat_params)
        format.html { redirect_to @articlecat, notice: 'Articlecat was successfully updated.' }
        format.json { render :show, status: :ok, location: @articlecat }
      else
        format.html { render :edit }
        format.json { render json: @articlecat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articlecats/1
  # DELETE /articlecats/1.json
  def destroy
    @articlecat.destroy
    respond_to do |format|
      format.html { redirect_to articlecats_url, notice: 'Articlecat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articlecat
      @articlecat = Articlecat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articlecat_params
      params.require(:articlecat).permit(:name, :video, :active)
    end
end
