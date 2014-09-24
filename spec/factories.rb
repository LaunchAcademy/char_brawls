FactoryGirl.define do
  factory :user do
    first_name "Humphrey"
    last_name "Bogart"
    email "crazyemail@something.gov"
    password "woooooooo2"
  end

  factory :character do
    name "Pikachu"
    bio "This motherfuckers a real shocker!"

    name "Sandshrew"
    bio "Oh shit!"
  end

factory :matchup do
    character_id 1
    opponent_id 2
  end

end
