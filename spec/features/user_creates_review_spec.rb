require 'rails_helper'
feature "Authenticated user creates a opinion", %{
  As an Authenticated user,
  I want to write a opinion
  so that I can tell the world about my opinions!
  }  do

  context "authenticated user" do
    before (:each) do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
    end

    scenario "User writes and submits a opinion" do
      matchup = FactoryGirl.create(:matchup)

      visit matchup_path(matchup)
      # Later, test how the user would navigate to this page, something like:
      # visit root_path
      # click_on "Browse Matchups"
      # click_on matchup.description  # description would be an instance method
      # on matchup, that returned some description like "Pikachu vs. Link"

      fill_in "Battle Notes", with: "I think that link is gonna kick that ass!"
      choose 'opinion_winner_id_' + matchup.character.id.to_s
      click_on "Create Opinion"

      expect(page).to have_content "The opinion has been created successfully."
    end

    scenario "User can't submit an empty opinion" do
      matchup = FactoryGirl.create(:matchup)
      visit matchup_path(matchup)
      choose 'opinion_winner_id_' + matchup.character.id.to_s
      click_on "Create Opinion"
      expect(page).to have_content "The opinion can't be empty!"
    end

    scenario "User can't submit exactly the same opinion text" do
      matchup = FactoryGirl.create(:matchup)
      FactoryGirl.create(:opinion)

      visit matchup_path(matchup)
      fill_in "Battle Notes", with: "I think that link is gonna kick that ass!"
      choose 'opinion_winner_id_' + matchup.character.id.to_s
      click_on "Create Opinion"
      expect(page).to have_content "That opinion already exists!"
    end
  end

  scenario "Unauthenticated user cannot create a opinion" do
    matchup = FactoryGirl.create(:matchup)
    visit matchup_path(matchup)
    fill_in "Battle Notes", with: "I think that link is gonna kick that ass!"
    choose 'opinion_winner_id_' + matchup.character.id.to_s
    click_on "Create Opinion"
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
