module Api::V1
  class PlayersController < ApiController
        before_action :authenticate
    
    def show
      @player = Player.find(params[:id])
    end
  end
 end