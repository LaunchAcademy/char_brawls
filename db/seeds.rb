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
  puts "Sending request to: #{creature["resource_uri"]}"
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
    }.to_json,
    resource_uri: creature["resource_uri"]
  }
  puts "Creating character: #{creature_attrs['name]']}"

  character = Character.find_or_initialize_by(name: creature_attrs[:name])
  character.assign_attributes(creature_attrs)
  character.save!
end

# n = 1
# while n < 719
#   query = Net::HTTP.get("pokeapi.co", "/api/v1/sprite/#{n}/")
#   pokemon = JSON.parse(query)
#   (pokemon["pokemon"]["resource_uri"]).slice!(0)
#   choice = Character.find_by(resource_uri:"#{pokemon["pokemon"]["resource_uri"]}")
#   choice.photo = "pokeapi.co#{pokemon["image"]}"
#   choice.save
#   n += 1
# end
