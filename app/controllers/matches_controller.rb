class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @matches = Match.all
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    if !Match.exists?(local:match_params[:local],visitor:match_params[:visitor])
      if @match.save
        redirect_to matches_path(tournament: match_params[:tournament_id]),notice:'Se creo correctamente el partido'
      else
        redirect_to matches_path(tournament: match_params[:tournament_id]),notice:'No se pudo crear correctamente el partido.'
      end
    elsif match_params[:local] == match_params[:visitor]
      redirect_to new_match_path(tournament: match_params[:tournament_id]), notice:'Los equipos deben ser diferentes.'
    elsif !Match.exists?(local:match_params[:local],date:match_params[:date]) || !Match.exists?(visitor:match_params[:visitor],date:match_params[:date])
      redirect_to new_match_path(tournament: match_params[:tournament_id]), notice:'Uno de los equipos ya jugo en esta fecha.'
    else
      redirect_to new_match_path(tournament: match_params[:tournament_id]), notice:'Estos equipos ya se enfrentaron.'
    end

  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_path(tournament: match_params[:tournament_id]), notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:tournament_id,:local,:visitor,:date)
    end
end
