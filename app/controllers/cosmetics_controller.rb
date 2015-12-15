class CosmeticsController < ApplicationController
  before_action :set_cosmetic, only: [:show, :edit, :update, :destroy]

  # GET /cosmetics
  # GET /cosmetics.json
  def index
   if params[:search]
     @cosmetics = Cosmetic.search(params[:search]).order("created_at DESC")
   else
     @cosmetics = Cosmetic.all.order('created_at DESC')
   end
  end

  # GET /cosmetics/1
  # GET /cosmetics/1.json
  def show
  end

  # GET /cosmetics/new
  def new
    @cosmetic = Cosmetic.new
    @categories = Category.all
  end

  # GET /cosmetics/1/edit
  def edit
    @categories = Category.all
  end

  # POST /cosmetics
  # POST /cosmetics.json
  def create
    @cosmetic = Cosmetic.new(cosmetic_params)

    respond_to do |format|
      if @cosmetic.save
        format.html { redirect_to @cosmetic, notice: 'Cosmetic was successfully created.' }
        format.json { render :show, status: :created, location: @cosmetic }
      else
        format.html { render :new }
        format.json { render json: @cosmetic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cosmetics/1
  # PATCH/PUT /cosmetics/1.json
  def update
    respond_to do |format|
      if @cosmetic.update(cosmetic_params)
        format.html { redirect_to @cosmetic, notice: 'Cosmetic was successfully updated.' }
        format.json { render :show, status: :ok, location: @cosmetic }
      else
        format.html { render :edit }
        format.json { render json: @cosmetic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cosmetics/1
  # DELETE /cosmetics/1.json
  def destroy
    @cosmetic.destroy
    respond_to do |format|
      format.html { redirect_to cosmetics_url, notice: 'Cosmetic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cosmetic
      @cosmetic = Cosmetic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cosmetic_params
      params.require(:cosmetic).permit(:name, :picture, :description, :category_id)
    end
end
