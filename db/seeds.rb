# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Monster.destroy_all
Dungeon.destroy_all

toa = Dungeon.create!(name: 'Tomb of Annihilation', deadly: 'true', adventurers_claimed: 500)
horror = Dungeon.create!(name: 'Tomb of Horrors', deadly: 'true', adventurers_claimed: 500)
candy = Dungeon.create!(name: 'Candy Mountain', deadly: 'false', adventurers_claimed: 1)

toa.monsters.create!(name: 'Lich', intelligent: 'true', hostile: 'true', pack_size: 1)
toa.monsters.create!(name: 'Aboleth', intelligent: 'true', hostile: 'false', pack_size: 1)
toa.monsters.create!(name: 'Tomb Guardian', intelligent: 'false', hostile: 'true', pack_size: 6)

horror.monsters.create!(name: 'Demilich', intelligent: 'true', hostile: 'true', pack_size: 1)
horror.monsters.create!(name: 'Glabrezu', intelligent: 'true', hostile: 'true', pack_size: 3)
horror.monsters.create!(name: 'Kobold', intelligent: 'true', hostile: 'false', pack_size: 20)

candy.monsters.create!(name: 'Unicorn', intelligent: 'true', hostile: 'true', pack_size: 2)
candy.monsters.create!(name: 'Charlie', intelligent: 'false', hostile: 'false', pack_size: 1)
candy.monsters.create!(name: 'Liopleurodon', intelligent: 'true', hostile: 'false', pack_size: 1)