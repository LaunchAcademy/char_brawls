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
  character_data = Net::HTTP.get("pokeapi.co", "/#{creature["resource_uri"]}")
  data = JSON.parse(character_data)
  creature_attrs = {
    name: creature["name"],
    body: {
      type: data["types"][0]["name"],
      abilities: data["abilities"][0]["name"],
      attack: data["attack"],
      defense: data["defense"],
      special_attack: data["sp_atk"],
      special_defense: data["sp_def"],
      speed: data["speed"]
    }.to_s,
    resource_uri: creature["resource_uri"]
  }
  Character.find_or_create_by(creature_attrs)
end



