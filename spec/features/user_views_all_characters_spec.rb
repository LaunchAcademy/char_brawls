require 'rails_helper'
feature 'user wants to see character details', %{
  As an user, I want to see information about my character
}  do

  scenario 'user can view character details' do
    character1 = FactoryGirl.create(:character)
    visit character_path(character1)
    expect(page).to have_content character1.name
  end

  scenario 'must link to individual matchups' do
    visit 'characters#show'
    expect(page).to have_content character.matchups
  end
  end
