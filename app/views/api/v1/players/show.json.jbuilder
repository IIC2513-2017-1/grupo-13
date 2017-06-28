json.user do
   json.href api_v1_user_url(@player)
   json.email @player.email
   json.first_name @player.first_name
   json.last_name @player.last_name
   json.position @player.position
   json.organizer @player.is_organizer
 end