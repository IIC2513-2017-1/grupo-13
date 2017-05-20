class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_player
  helper_method :current_organizer
  helper_method :current_tournament

  protected

  def current_player
    if defined?(@current_player)
      return @current_player
    else
      @current_player = session.key?(:user_id) && Player.find(session[:user_id])
    end
  end
  def current_tournament(tournament)
    if defined?(@current_tournament)
      return @current_tournament
    else
      @current_tournament = tournament
    end
    puts '111111111111111'
    puts tournament
    puts '-111111111111'
  end

end
