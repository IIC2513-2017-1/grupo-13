module Api::V1
    class TeamsController < ApiController
        before_action :authenticate
        def index
            @teams = Teams.includes(:player).all
        end

        def create
            @team = @current_player.teams.build(teams_params.merge(capitan:@current_player.id))
            return if @tweet.save
                render json: {errors: @team.errors}, status: :unprocessable_entity
            end
        end

        def show
            @teams = Teams.find(params[:id])
        end
        
        

        private
        def team_params
            params.require(:team).permit(:name)
        end
end
