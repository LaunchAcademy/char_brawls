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
  end

end
