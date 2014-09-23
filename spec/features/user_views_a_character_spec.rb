require 'rails_helper'
feature "user wants to see characters", %Q{
As an user,
I want to see a list of characters
}  do

scenario "user can view characters" do
character_1 = FactoryGirl.create(:character)
character_2 = FactoryGirl.create(:character)
  expect(page).to have_content character1.name
  expect(page).to have_content character2.name
end

scenario "must link to individual characters"
visit '/characters'
expect(page).to have_link character.name, href: 'characters/{#id}'
end
end