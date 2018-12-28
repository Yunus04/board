# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'yunus@gmail.com', name: 'Mohamad Yunus', password: 'yunus123')
User.create!(email: 'anugrah@gmail.com', name: 'Anugrah Wardhani', password: 'anugrah123')
User.create!(email: 'alan@gmail.com', name: 'Muhamad Alan', password: 'alan123')
User.create!(email: 'iman@gmail.com', name: 'Iman Ismayana', password: 'iman123')
User.create!(email: 'heru@gmail.com', name: 'Heru Julyanto', password: 'iman123')
Team.create!(name: 'nineod', create_at: 'datetime.now' )
Position.create!(user_id: 1, team_id: 1, position: 3)
Position.create!(user_id: 2, team_id: 1, position: 0)
Position.create!(user_id: 3, team_id: 1, position: 0)
Position.create!(user_id: 4, team_id: 1, position: 1)
Position.create!(user_id: 5, team_id: 1, position: 2)
