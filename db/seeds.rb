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


Team.create(name: "Palestino", capitan: Player.all.sample.id, logo: seed_image_teams("bocajuniors"))
Team.create(name: "Barcelona", capitan: Player.all.sample.id, logo: seed_image_teams("barcelona"))
Team.create(name: "S.Wanderers", capitan: Player.all.sample.id, logo: seed_image_teams("wanderers"))
Team.create(name: "Real Madrid", capitan: Player.all.sample.id, logo: seed_image_teams("real_madrid"))
Team.create(name: "Manchester", capitan: Player.all.sample.id, logo: seed_image_teams("manchester"))



Player.all.collect do |player|
  Teamplayer.create([{
    player_id: player.id,
    team_id: Team.all.sample.id,
    }])
end


Tournament.create(name: "Champions League", organizer: Player.first.first_name, place: "Wembley", number_team: 4, number_date: 6)
Tournament.create(name: "Copa Chile", organizer: Player.all.sample.first_name, place: "Estadio nacional", number_team: 10, number_date: 6)



