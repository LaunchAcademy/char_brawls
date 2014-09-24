require 'rails_helper'
feature "Authenticated user creates a review", %Q{
As an Authenticated user,
I want to write a review
so that I can tell the world about my opinions!
}  do

  scenario "User writes and submits a review" do
    visit '/matchups/1'

    # visit new_matchup_review_path
    fill_in "Battle Notes", with: "I think that link is gonna kick that ass!"
    click_on "Submit"

    expect(page).to have_content "The review has been created successfully."
  end

  scenario "User can't submit an empty review" do

    visit '/matchups/1'

      # visit new_matchup_review_path
    click_on "Submit"

    expect(page).to have_content "The review can't be empty!"
  end

  scenario "User can't submit exactly the same review text" do

    visit '/matchups/1'
    # visit new_matchup_review_path

    fill_in "Battle Notes", with: "I think that link is gonna kick that ass!"
    click_on "Submit"

    expect(page).to have_content "That review already exists!"
  end
end
