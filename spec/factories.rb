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
    body "{\"attack\":5,\"defense\":16}"
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
