class UserMailer < ActionMailer::Base
    default :from => "me@mydomain.com"

 def registration_confirmation(player)
    @player = player
    mail(:to => "#{player.first_name} <#{user.mail}>", :subject => "Registration Confirmation")
 end

end
