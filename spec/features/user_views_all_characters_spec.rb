require 'rails_helper'
feature 'user wants to see character details', %{
  As an user, I want to see information about my character
}  do

  scenario 'user can view character details' do
    @character = FactoryGirl.create(:character)
    visit character_path(@character)
    expect(page).to have_content @character.name
  end

  scenario "must link to individual matchups" do
    character1 = FactoryGirl.create(:character)
    visit character_path(character1)
    expect(page).to have_content character.matchups
  end
end
