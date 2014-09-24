require 'rails_helper'
feature "Authenticated user creates a review", %{
As an Authenticated user,
I want to write a review
so that I can tell the world about my opinions!
}  do

  scenario "User writes and submits a review" do
    matchup = FactoryGirl.create(:matchup)
    visit matchup_path(matchup)

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
