# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'net/http'

results = Net::HTTP.get("pokeapi.co", "/api/v1/pokedex/1/")

pokemon = JSON.parse(results)["pokemon"]

pokemon.each do |creature|
  Character.create!(name: creature["name"], resource_uri: creature["resource_uri"])
end



