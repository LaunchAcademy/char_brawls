require 'rails_helper'
feature 'user wants to see character details', %{
  As an user, I want to see information about my character
}  do

  scenario 'user can view character details' do
    character1 = FactoryGirl.create(:character)
    visit character_path(character1)
    expect(page).to have_content character1.name
  end

<<<<<<< HEAD
  scenario "must link to individual matchups" do
    visit character_path(character1)
=======
  scenario 'must link to individual matchups' do
    visit 'characters#show'
>>>>>>> 6623cf88ba6ea1495a2f1ed2cfd5c5248a2ec46f
    expect(page).to have_content character.matchups
  end
end
