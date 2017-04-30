# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.delete_all
Organizer.delete_all
Team.delete_all
Team_Player.delete_all

30.times do
  password = Faker::Internet.password(6,15)
  Player.create([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mail: Faker::Internet.unique.free_email,
    password: password,
    password_confirmation: password,
    age: 20,
    position: "Delantero"
    }])
end


5.times do
  password = Faker::Internet.password(6,15)
  Organizer.create([{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mail: Faker::Internet.unique.free_email,
    password: password,
    age: 20
    }])
end

2.times do
  Team.create([{
    name: Faker::GameOfThrones.city,
    capitan: Player.all.collect.sample,
    logo: "Imagen"
    }])
end

Player.all.collect do |player|
  Team_player.create([{
    player_id: player.id,
    team_id: Team.all.collect.sample,
    }])
end
