module Api::V1
    class ApiController < ActionController::API
        include ActionControlle::HttpaAuthentication::Token::ControllerMethods


        protected


        def authenticate
            authenticate_or_request_with_http_token do |token, _options|
                @current_player = Player.find_by(token: token)
            end
        end
        
    end
 end