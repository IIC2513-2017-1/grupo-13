class SessionsController < ApplicationController

  def new
  end

  def create
    player = Player.find_by(mail: params[:session][:mail])
    if player&.authenticate(params[:session][:password])
      if player.email_confirmed
        session[:user_id] = player.id
        redirect_to teams_path, notice: 'Login successful.'
      elsif
        redirect_to(new_sessions_path, alert: 'Wrong email or password.')

      else
        flash.now[:error] = 'Please activate your account by following the
                        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successful.'
  end
end
