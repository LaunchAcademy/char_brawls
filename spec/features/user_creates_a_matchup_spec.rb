require 'rails_helper'
feature "Authenticated user creates a match-up", %Q{
  As an user
  I want to create a match-up
  so dat I can face these fools off
  }  do

  scenario "User makes a match-up" do
    character = FactoryGirl.create(:character)
    opponent = FactoryGirl.create(:character)

    visit root_path
    click_on "Create A Matchup"
    select character.name, from: "Character One"
    select opponent.name, from: "Character Two"
    click_on "Submit"

    expect(page).to have_content "The matchup has been created successfully."
  end

  scenario "User can't choose the same char twice" do
    character = FactoryGirl.create(:character)

    visit new_matchup_path
    select character.name, from: "Character One"
    select character.name, from: "Character Two"
    click_on "Submit"

    expect(page).to have_content "Your matchup could not be saved!"
    expect(page).to have_content "Characters cannot battle themselves!"
  end

  scenario "User can't duplicate an existing match-up" do
    matchup = FactoryGirl.create(:matchup)

    visit new_matchup_path
    select matchup.character.name, from: "Character One"
    select matchup.opponent.name, from: "Character Two"
    click_on "Submit"

    expect(page).to have_content "That matchup already exists!"
  end

  scenario "User does not select characters" do
    characters = FactoryGirl.create_list(:character, 2)
    visit new_matchup_path

    click_on "Submit"

    expect(page).to have_content "Your matchup could not be saved!"
    expect(page).to have_content "Character can't be blank"
    expect(page).to have_content "Opponent can't be blank"
  end
end
