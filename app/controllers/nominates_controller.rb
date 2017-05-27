class NominatesController < ApplicationController
  before_action :set_nominate, only: [:show, :edit, :update, :destroy]

  # GET /nominates
  # GET /nominates.json
  def index
    @nominates = Nominate.all
  end

  # GET /nominates/1
  # GET /nominates/1.json
  def show
  end

  # GET /nominates/new
  def new
    @nominate = Nominate.new
  end

  # GET /nominates/1/edit
  def edit
  end

  # POST /nominates
  # POST /nominates.json
  def create
    @nominate = Nominate.new(nominate_params)

    respond_to do |format|
      if @nominate.save
        format.html { redirect_to @nominate, notice: 'Nominate was successfully created.' }
        format.json { render :show, status: :created, location: @nominate }
      else
        format.html { render :new }
        format.json { render json: @nominate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nominates/1
  # PATCH/PUT /nominates/1.json
  def update
    respond_to do |format|
      if @nominate.update(nominate_params)
        format.html { redirect_to @nominate, notice: 'Nominate was successfully updated.' }
        format.json { render :show, status: :ok, location: @nominate }
      else
        format.html { render :edit }
        format.json { render json: @nominate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominates/1
  # DELETE /nominates/1.json
  def destroy
    @nominate.destroy
    respond_to do |format|
      format.html { redirect_to nominates_url, notice: 'Nominate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nominate
      @nominate = Nominate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nominate_params
      params.require(:nominate).permit(:match_id,:player_id,:team_id)
    end
end
