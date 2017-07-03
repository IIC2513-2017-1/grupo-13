class TournamentteamsController < ApplicationController
  before_action :set_tournamentteam, only: [:show, :edit, :update, :destroy]
  #before_action :total_team

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


  def invitacion
  end
  def aceptar
    team = Tournamentteam.where('team_id = ? AND tournament_id = ?',params[:team],params[:tournament])
    team.update(i_team:true,i_tournament:true)
    redirect_to invitacion_path
  end

  # POST /tournamentteams
  # POST /tournamentteams.json
  def create
      if params[:solicitar]
        @tournamentteam = Tournamentteam.new(tournamentteam_params.merge(i_team:true))
      else
        @tournamentteam = Tournamentteam.new(tournamentteam_params.merge(i_tournament:true))
      end
      if !Tournamentteam.exists?(tournament_id:tournamentteam_params[:tournament_id],team_id:tournamentteam_params[:team_id])
      respond_to do |format|
      if @tournamentteam.save
        format.html { redirect_to tournament_path(tournamentteam_params[:tournament_id]), notice: 'Equipo agregado correctamente.' }
        format.json { render :show, status: :created, location: @tournamentteam }

#new_tournamentteam_path(tournament:tournamentteam_params[:tournament_id])
      else
        format.html { redirect_to  new_tournamentteam_path(tournament:tournamentteam_params[:tournament_id]),notice: 'No se puede agregar el equipo al torneo.' }
        format.json { render json: @tournamentteam.errors, status: :unprocessable_entity }
      end
      end
    else
      redirect_to  new_tournamentteam_path(tournament:tournamentteam_params[:tournament_id]),notice: 'Equipo ya fue agregado al torneo.'
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournamentteam
      @tournamentteam = Tournamentteam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournamentteam_params
      params.require(:tournamentteam).permit(:team_id, :tournament_id)
    end
end
