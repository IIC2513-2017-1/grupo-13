class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_player
  helper_method :current_organizer

  protected

  def current_player
    return @current_player if defined?(@current_player)
    @current_player = session.key?(:user_id) && Player.find(session[:user_id])
  end

  def current_organizer
    return @current_organizer if defined?(@current_organizer)
    @current_organizer = session.key?(:user_id) && Organizer.find(session[:user_id])
  end
end
