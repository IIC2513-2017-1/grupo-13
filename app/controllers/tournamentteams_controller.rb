class TournamentteamsController < ApplicationController
  before_action :set_tournamentteam, only: [:show, :edit, :update, :destroy]
  before_action :total_team

  # GET /tournamentteams
  # GET /tournamentteams.json
  def index
    @tournamentteams = Tournamentteam.all
  end

  # GET /tournamentteams/1
  # GET /tournamentteams/1.json
  def show
  end

  # GET /tournamentteams/new
  def new
    @tournamentteam = Tournamentteam.new
  end

  # GET /tournamentteams/1/edit
  def edit
  end

  # POST /tournamentteams
  # POST /tournamentteams.json
  def create
    @tournamentteam = Tournamentteam.new(tournamentteam_params)

    respond_to do |format|
      if total_team >= Tournament.find(@tournamentteam.tournament_id).number_team
        return :false
      elsif @tournamentteam.save
        format.html { redirect_to @tournamentteam, notice: 'Tournamentteam was successfully created.' }
        format.json { render :show, status: :created, location: @tournamentteam }
        if (total_team + 1) == Tournament.find(@tournamentteam.tournament_id).number_team
          format.html { redirect_to tournaments_path, notice: 'Se completo el torneo, se creo el fixture.' }
        end

      else
        format.html { render :new }
        format.json { render json: @tournamentteam.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /tournamentteams/1
  # PATCH/PUT /tournamentteams/1.json
  def update
    respond_to do |format|
      if @tournamentteam.update(tournamentteam_params)
        format.html { redirect_to @tournamentteam, notice: 'Tournamentteam was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournamentteam }
      else
        format.html { render :edit }
        format.json { render json: @tournamentteam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournamentteams/1
  # DELETE /tournamentteams/1.json
  def destroy
    @tournamentteam.destroy
    respond_to do |format|
      format.html { redirect_to tournamentteams_url, notice: 'Tournamentteam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def total_team
    Tournamentteam.where({tournament_id: @tournamentteam.tournament_id}).count
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournamentteam
      @tournamentteam = Tournamentteam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournamentteam_params
      params.require(:tournamentteam).permit(:tournament_id, :team_id)
    end
end
