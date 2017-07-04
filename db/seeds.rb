# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_image_teams(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/teams/#{file_name}.png"))
end


Player.delete_all
Team.delete_all
Teamplayer.delete_all
Tournament.delete_all
Tournamentteam.delete_all
Match.delete_all
Event.delete_all
Result.delete_all


positions = ["Delantero", "Arquero", "Defensa","Mediocampista"]

p1 = Player.create(
  first_name: 'Nicolas',
  last_name: 'Julio',
  mail: 'nijulio@uc.cl',
  password: '123456',
  password_confirmation: '123456',
  birthday: Time.now.to_date - 22.years,
  position: 'Defensa',
  is_organizer: true
    )
p1.generate_token_and_save


p2 = Player.create(
  first_name: 'Cristobal',
  last_name: 'Abarca',
  mail: 'caabarca@uc.cl',
  password: '123456',
  password_confirmation: '123456',
  birthday: Time.now.to_date - 22.years,
  position: 'Defensa',
  is_organizer: false
    )
p2.generate_token_and_save

30.times do
  password = Faker::Internet.password(6,15)
  Player.create([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mail: Faker::Internet.unique.free_email,
    password: password,
    password_confirmation: password,
    birthday: Time.now.to_date - 25.years,
    position: positions.sample,
    is_organizer: false
    }])
end


Team.create(name: "Boca Juniors", capitan: Player.all.sample.id, logo: seed_image_teams("bocajuniors"))
Team.create(name: "Barcelona", capitan: Player.all.sample.id, logo: seed_image_teams("barcelona"))
Team.create(name: "S.Wanderers", capitan: Player.all.sample.id, logo: seed_image_teams("wanderers"))
Team.create(name: "Real Madrid", capitan: Player.all.sample.id, logo: seed_image_teams("real_madrid"))
Team.create(name: "Manchester United", capitan: Player.all.sample.id, logo: seed_image_teams("manchester"))
Team.create(name: "Universidad de Chile", capitan: Player.all.sample.id,logo: seed_image_teams("udechile"))
Team.create(name: "Arsenal", capitan: Player.all.sample.id,logo: seed_image_teams("arsenal"))
Team.create(name: "Colo Colo", capitan: Player.all.sample.id,logo: seed_image_teams("colocolo"))
Team.create(name: "Bayern Munchen", capitan: Player.all.sample.id,logo: seed_image_teams("bayern_munchen"))
Team.create(name: "Lanús", capitan: Player.all.sample.id,logo: seed_image_teams("lanus"))
Team.create(name: "River Plate", capitan: Player.all.sample.id,logo: seed_image_teams("river_plate"))
Team.create(name: "Santos", capitan: Player.all.sample.id,logo: seed_image_teams("santos"))
Team.create(name: "Botafogo", capitan: Player.all.sample.id,logo: seed_image_teams("botafogo"))
Team.create(name: "Peñarol", capitan: Player.all.sample.id,logo: seed_image_teams("peñarol"))
Team.create(name: "Emelec", capitan: Player.all.sample.id,logo: seed_image_teams("emelec"))
Team.create(name: "Benfica", capitan: Player.all.sample.id,logo: seed_image_teams("benfica"))
Team.create(name: "Manchester City", capitan: Player.all.sample.id,logo: seed_image_teams("manchester_city"))
Team.create(name: "Borussia Dortmund", capitan: Player.all.sample.id,logo: seed_image_teams("borussia"))
Team.create(name: "Juventus", capitan: Player.all.sample.id,logo: seed_image_teams("juventus"))
Team.create(name: "Bayer Leverkusen", capitan: Player.all.sample.id,logo: seed_image_teams("bayer_leverkusen"))




Tournament.create(name: "Champions League", organizer: Player.find_by(first_name:'Nicolas').id, place: "Wembley", number_team: 4, number_date: 6)
Tournament.create(name: "Copa Libertadores", organizer: Player.all.sample.id, place: "Estadio nacional", number_team: 10, number_date: 6)


Player.all.collect do |player|
  Teamplayer.create([{
    player_id: player.id,
    team_id: Team.all.sample.id,
    i_team:true,
    i_player:true,
    }])
end

  Tournamentteam.create(team_id: Team.find_by(name:"Barcelona").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Real Madrid").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Manchester United").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Boca Juniors").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"S.Wanderers").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Universidad de Chile").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Colo Colo").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Arsenal").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Bayern Munchen").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Manchester City").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Bayer Leverkusen").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Juventus").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Borussia Dortmund").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Benfica").id,tournament_id: Tournament.find_by(name:"Champions League").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Lanús").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"River Plate").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Santos").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Botafogo").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Peñarol").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)
  Tournamentteam.create(team_id: Team.find_by(name:"Emelec").id,tournament_id: Tournament.find_by(name:"Copa Libertadores").id, i_tournament: true, i_team: true)

Match.create(local:Team.find_by(name:"Barcelona").id,visitor:Team.find_by(name:"Real Madrid").id,date:1,tournament_id:Tournament.find_by(name:"Champions League").id)
Match.create(local:Team.find_by(name:'Manchester United').id,visitor:Team.find_by(name:"Arsenal").id,date:1,tournament_id:Tournament.find_by(name:"Champions League").id)
Match.create(local:Team.find_by(name:"Bayern Munchen").id,visitor:Team.find_by(name:"Manchester City").id,date:1,tournament_id:Tournament.find_by(name:"Champions League").id)
Match.create(local:Team.find_by(name:"Bayer Leverkusen").id,visitor:Team.find_by(name:"Juventus").id,date:1,tournament_id:Tournament.find_by(name:"Champions League").id)
Match.create(local:Team.find_by(name:"Borussia Dortmund").id,visitor:Team.find_by(name:"Benfica").id,date:1,tournament_id:Tournament.find_by(name:"Champions League").id)

Match.create(local:Team.find_by(name:"Barcelona").id,visitor:Team.find_by(name:"Manchester United").id,date:2,tournament_id:Tournament.find_by(name:"Champions League").id)
Match.create(local:Team.find_by(name:'Real Madrid').id,visitor:Team.find_by(name:"Arsenal").id,date:2,tournament_id:Tournament.find_by(name:"Champions League").id)
Match.create(local:Team.find_by(name:"Juventus").id,visitor:Team.find_by(name:"Benfica").id,date:2,tournament_id:Tournament.find_by(name:"Champions League").id)
Match.create(local:Team.find_by(name:"Bayer Leverkusen").id,visitor:Team.find_by(name:"Bayern Munchen").id,date:2,tournament_id:Tournament.find_by(name:"Champions League").id)
Match.create(local:Team.find_by(name:"Borussia Dortmund").id,visitor:Team.find_by(name:"Manchester City").id,date:2,tournament_id:Tournament.find_by(name:"Champions League").id)

Match.create(local:Team.find_by(name:"Santos").id,visitor:Team.find_by(name:"Lanús").id,date:1,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)
Match.create(local:Team.find_by(name:"River Plate").id,visitor:Team.find_by(name:"Botafogo").id,date:1,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)
Match.create(local:Team.find_by(name:"Colo Colo").id,visitor:Team.find_by(name:"Emelec").id,date:1,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)
Match.create(local:Team.find_by(name:"Universidad de Chile").id,visitor:Team.find_by(name:"Peñarol").id,date:1,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)
Match.create(local:Team.find_by(name:"S.Wanderers").id,visitor:Team.find_by(name:"Boca Juniors").id,date:1,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)

Match.create(local:Team.find_by(name:"Santos").id,visitor:Team.find_by(name:"S.Wanderers").id,date:2,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)
Match.create(local:Team.find_by(name:"Botafogo").id,visitor:Team.find_by(name:"Emelec").id,date:2,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)
Match.create(local:Team.find_by(name:"Peñarol").id,visitor:Team.find_by(name:"Lanús").id,date:2,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)
Match.create(local:Team.find_by(name:"Colo Colo").id,visitor:Team.find_by(name:"River Plate").id,date:2,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)
Match.create(local:Team.find_by(name:"Universidad de Chile").id,visitor:Team.find_by(name:"Boca Juniors").id,date:2,tournament_id:Tournament.find_by(name:"Copa Libertadores").id)

30.times do
  Event.create(player_id:Player.all.sample.id,goals:[0,1,2,3,4,5].sample,yellow_cards:[0,1,2].sample,red_cards:[0,1].sample,match_id:Match.all.sample.id)
end
