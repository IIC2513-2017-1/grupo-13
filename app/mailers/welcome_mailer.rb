class WelcomeMailer < ApplicationMailer
  def notify(player)
    @player = player
    mail(to: player.mail, subject: 'Bienvenido')
  end
end
