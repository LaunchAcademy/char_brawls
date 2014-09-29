require 'rails_helper'
feature 'user wants to see character details', %{
  As an user, I want to see information about my character
  }  do

  scenario 'user can view character details and matchups' do

    character = FactoryGirl.create(:character)
    FactoryGirl.create_list(:matchup, 3, character: character)
    visit character_path(character)
    expect(page).to have_content character.name
    character.matchups.each do |matchup|
      expect(page).to have_content matchup.opponent.name
    end
  end
end
