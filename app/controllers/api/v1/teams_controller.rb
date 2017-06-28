module Api::V1
    class TeamsController < ApiController
        before_action :authenticate


        def index
            @teams = Team.all
        end     
        
        def create
            @team = Team.new(team_params.merge(capitan:@current_player.id))
            return if @team.save
            render json: {errors: @team.errors}, status: :unprocessable_entity
        end     
        
        def show
            @team = Team.find(params[:id])
        end

    
        private
        def team_params
            params.require(:team).permit(:name)
        end
    end
end
