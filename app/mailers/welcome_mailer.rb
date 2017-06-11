class WelcomeMailer < ApplicationMailer
  def notify(player)
    @player = player
    mail subject: "New follower: #{@player.first_name}", to: @player.mail
  end
end
