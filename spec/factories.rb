FactoryGirl.define do

  factory :user do
    first_name "Humphrey"
    last_name "Bogart"
    email "crazyemail@something.gov"
    password "woooooooo2"
  end

  factory :character, aliases: [:opponent] do
    sequence :name do |n|
      "#{n}Pikachu"
    end
    sequence :resource_uri do |n|
      "#{n}api/v1/pokemon/"
    end
  end

  factory :matchup do
    character
    opponent
  end

    factory :opinion do
      body "I think that link is gonna kick that ass!"
      winner_id 1
      matchup_id 1000
  end
end
