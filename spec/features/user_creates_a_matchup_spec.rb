require 'rails_helper'
feature "Authenticated user creates a match-up", %Q{
As an user,
I want to create a match-up with a review
so dat I can face these fools off
}  do

  scenario "User makes a match-up" do

    Character_one = FactoryGirl.create(:matchup)
    Character_two = FactoryGirl.create(:matchup)
    visit new_matchup_path
    select "Character_one", :from => "Character One"
    select "Character_two", :from => "Character Two"
    click_on "Submit"

    expect(page).to have_content "The matchup has been created successfully."
  end

  scenario "User can't choose the same char twice" do

    matchup = FactoryGirl.create(:matchup)
    visit new_matchup_path
    select "Pikachu", :from => "Character One"
    select "Pikachu", :from => "Character Two"
    click_on "Submit"

    expect(page).to have_content "A matchup must have two different characters."
  end

  scenario "User can't duplicate an existing match-up" do

    matchup = FactoryGirl.create(:matchup)
    visit new_matchup_path
    select "Pikachu", :from => "Character One"
    select "Sandshrew", :from => "Character Two"
    click_on "Submit"

    expect(page).to have_content "That matchup already exists!"
  end

  scenario "User must choose two characters" do

    matchup = FactoryGirl.create(:matchup)
    visit new_matchup_path
    select "Pikachu", :from => "Character One"
    click_on "Submit"

    expect(page).to have_content "A matchup must have two different characters."
  end

  scenario "User must choose a character" do

    matchup = FactoryGirl.create(:matchup)
    visit new_matchup_path(matchup)
    click_on "Submit"

    expect(page).to have_content "A matchup must have two different characters."
  end

end
