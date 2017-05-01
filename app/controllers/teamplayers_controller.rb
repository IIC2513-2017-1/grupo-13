class TeamplayersController < ApplicationController
  before_action :set_teamplayer, only: [:show, :edit, :update, :destroy]

  # GET /teamplayers
  # GET /teamplayers.json
  def index
    @teamplayers = Teamplayer.all
  end

  # GET /teamplayers/1
  # GET /teamplayers/1.json
  def show
  end

  # GET /teamplayers/new
  def new
    @teamplayer = Teamplayer.new
  end

  # GET /teamplayers/1/edit
  def edit
  end

  # POST /teamplayers
  # POST /teamplayers.json
  def create
    @teamplayer = Teamplayer.new(teamplayer_params)

    respond_to do |format|
      if @teamplayer.save
        format.html { redirect_to @team, notice: 'Teamplayer was successfully created.' }
        format.json { render :show, status: :created, location: @teamplayer }
      else
        format.html { render :new }
        format.json { render json: @teamplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teamplayers/1
  # PATCH/PUT /teamplayers/1.json
  def update
    respond_to do |format|
      if @teamplayer.update(teamplayer_params)
        format.html { redirect_to @teamplayer, notice: 'Teamplayer was successfully updated.' }
        format.json { render :show, status: :ok, location: @teamplayer }
      else
        format.html { render :edit }
        format.json { render json: @teamplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teamplayers/1
  # DELETE /teamplayers/1.json
  def destroy
    @teamplayer.destroy
    respond_to do |format|
      format.html { redirect_to teamplayers_url, notice: 'Teamplayer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teamplayer
      @teamplayer = Teamplayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teamplayer_params
      params.require(:teamplayer).permit(:player_id, :team_id)
    end
end
