require 'rails_helper'
feature "Authenticated user creates a match-up", %Q{
As an user,
I want to create a match-up with a review
so dat I can face these fools off
}  do

  scenario "User makes a match-up" do

    visit new_matchup_path
    select "Pikachu", :from => "Character One"
    select "Sandshrew", :from => "Character Two"
    fill_in "Battle Notes", with: "This is a battle not to be missed~~~~~~~\(^_^)/"
    click_on "Submit"

  end

  scenario "User can't choose the same char twice" do

    visit new_matchup_path
    select "Pikachu", :from => "Character One"
    select "Pikachu", :from => "Character Two"
    fill_in "Battle Notes", with: "This is a battle not to be missed~~~~~~~\(^_^)/"
    click_on "Submit"

  end

  scenario "User can't duplicate an existing match-up" do

    visit new_matchup_path
    select "Pikachu", :from => "Character One"
    select "Sandshrew", :from => "Character Two"
    fill_in "Battle Notes", with: "This is a battle not to be missed~~~~~~~\(^_^)/"
    click_on "Submit"

  end

  scenario "User must choose two characters" do

    visit new_matchup_path
    select "Pikachu", :from => "Character One"
    fill_in "Battle Notes", with: "This is a battle not to be missed~~~~~~~\(^_^)/"
    click_on "Submit"

  end

  scenario "User must choose a character" do

    visit new_matchup_path
    fill_in "Battle Notes", with: "This is a battle not to be missed~~~~~~~\(^_^)/"
    click_on "Submit"

  end

end
