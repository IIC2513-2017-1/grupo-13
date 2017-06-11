class WelcomeMailer < ActionMailer::Base
    default :from => "me@mydomain.com"

 def notify(player)
    @player = player
    mail(:to => "#{player.first_name} <#{user.mail}>", :subject => "Registration Confirmation")
 end

end
