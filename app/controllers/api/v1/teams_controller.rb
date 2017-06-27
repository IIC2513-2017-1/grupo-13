module Api::V1
    class TeamsController < ApiController
        before_action :authenticate
        def index
            @teams = Teams.includes(:player).all
        end

        def create
            @team = Team.new(team_params)
            return if @tweet.save
                render json: {errors: @team.errors}, status: :unprocessable_entity
            end
        end
        

        private
        def team_params
            params.require(:team).permit(:name, :capitan)
        end
    end
end
