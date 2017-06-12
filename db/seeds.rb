# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.delete_all
Team.delete_all
Teamplayer.delete_all
Tournament.delete_all


positions = ["Delantero", "Arquero", "Defensa","Mediocampista"]

Player.create([{
  first_name: 'Nicolas',
  last_name: 'Julio',
  mail: 'nijulio@uc.cl',
  password: '123456',
  password_confirmation: '123456',
  birthday: Time.now.to_date - 22.years,
  position: 'Defensa',
  is_organizer: true
    }])

Player.create([{
  first_name: 'Cristobal',
  last_name: 'Abarca',
  mail: 'caabarca@uc.cl',
  password: '123456',
  password_confirmation: '123456',
  birthday: Time.now.to_date - 22.years,
  position: 'Defensa',
  is_organizer: false
    }])


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

5.times do
  Team.create([{
    name: Faker::GameOfThrones.city,
    capitan: Player.all.sample.id,
    logo: ""
    }])
end

Player.all.collect do |player|
  Teamplayer.create([{
    player_id: player.id,
    team_id: Team.all.sample.id,
    }])
end
2.times do
  Tournament.create([{
    name:Faker::StarWars.planet,
    organizer: Player.all.sample.first_name,
    place: Faker::HarryPotter.location,
    number_team: 4,
    number_date: 3

    }])
end
