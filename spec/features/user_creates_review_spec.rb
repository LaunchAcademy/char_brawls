require 'rails_helper'
feature "Authenticated user creates a review", %{
  As an Authenticated user,
  I want to write a review
  so that I can tell the world about my opinions!
  }  do

  context "authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
    end

    scenario "User writes and submits a review" do
      matchup = FactoryGirl.create(:matchup)
      visit matchup_path(matchup)
      # Later, test how the user would navigate to this page, something like:
      # visit root_path
      # click_on "Browse Matchups"
      # click_on matchup.description  # description would be an instance method
      # on matchup, that returned some description like "Pikachu vs. Link"

      fill_in "Battle Notes", with: "I think that link is gonna kick that ass!"
      click_on "Submit"

      expect(page).to have_content "The review has been created successfully."
    end

    scenario "User can't submit an empty review" do
      matchup = FactoryGirl.create(:matchup)
      visit matchup_path(matchup)
      click_on "Submit"
      expect(page).to have_content "The review can't be empty!"
    end

    scenario "User can't submit exactly the same review text" do
      matchup = FactoryGirl.create(:matchup)
      visit matchup_path(matchup)
      fill_in "Battle Notes", with: "I think that link is gonna kick that ass!"
      click_on "Submit"
      expect(page).to have_content "That review already exists!"
    end
  end

  scenario "Unauthenticated user cannot create a review"
end
