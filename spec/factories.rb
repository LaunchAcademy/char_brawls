FactoryGirl.define do

  factory :user do
    first_name "Humphrey"
    last_name "Bogart"
    sequence :email do |n|
      "#{n}crazyemail@something.gov"
    end
    password "woooooooo2"
  end

  factory :character, aliases: [:opponent] do
    sequence :name do |n|
      "#{n}Pikachu"
    end
    sequence :resource_uri do |n|
      "#{n}api/v1/pokemon/"
    end
    body "{\"type\":\"poison\",\"abilities\":\"shed-skin\",\"attack\":25,\"defense\":50,\"special_attack\":25,\"special_defense\":25,\"speed\":35}"
  end

  factory :matchup do
    character
    opponent
  end

  factory :opinion do
    body "I think that link is gonna kick that ass!"
    matchup
    user
    winner { matchup.character }
  end
end
