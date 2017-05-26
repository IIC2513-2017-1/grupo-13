class SessionsController < ApplicationController

  def new
  end

  def create
    player = Player.find_by(mail: params[:session][:mail])
    if player&.authenticate(params[:session][:password])
      session[:user_id] = player.id
      redirect_to teams_path, notice: 'Login successful.'
    else
      redirect_to(new_sessions_path, alert: 'Wrong email or password.')
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successful.'
  end
end
