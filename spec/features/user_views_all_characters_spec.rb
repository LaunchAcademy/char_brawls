require 'rails_helper'
feature "user wants to see character details", %Q{
As an user, I want to see information about my character
}  do

scenario "user can view character details" do
visit 'characters#show'
character_1 = FactoryGirl.create(:character)
  expect(page).to have_content character1.name
  expect(page).to have_content character1.body
end

scenario "must link to individual matchups"
visit 'characters#show'
expect(page).to have_content character.matchups
end
end
