# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.delete_all
Organizer.delete_all
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
  age: 22,
  position: 'Defensa'
    }])

30.times do
  password = Faker::Internet.password(6,15)
  Player.create([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mail: Faker::Internet.unique.free_email,
    password: password,
    password_confirmation: password,
    age: 20,
    position: positions.sample
    }])
end

5.times do
  password = Faker::Internet.password(6,15)
  Organizer.create!([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mail: Faker::Internet.unique.free_email,
    password: password,
    age: 26
    }])
end

5.times do
  Team.create([{
    name: Faker::GameOfThrones.city,
    capitan: Player.all.sample.first_name,
    logo: "Imagen"
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
    organizer: Organizer.all.sample.first_name,
    place: Faker::HarryPotter.location,
    number_team: 4,
    number_date: 3

    }])
end
