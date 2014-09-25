require 'rails_helper'
feature 'user wants to see character details', %{
  As an user, I want to see information about my character
}  do

  let(:character) { FactoryGirl.create(:character) }
  let!(:matchups) { FactoryGirl.create_list(:matchup, 3, character: character) }

  scenario 'user can view character details' do
    visit character_path(character)
    expect(page).to have_content character.name
  end

  scenario "must link to individual matchups" do
    visit character_path(character)

    character.matchups.each do |matchup|
      expect(page).to have_content matchup.opponent.name
    end
  end
end
