require 'rails_helper'
feature "User creates a new account", %Q{
As an authenticated user I want to:
Create matchup
 Write an opinion
 Vote on the outcome of a matchup
 Edit their own review
 See sign-out button
}  do

scenario "User provides required information" do

 visit root_path

 click_on "sign up"
 fill_in "Email", with: "abc@example.com"
 fill_in "Password", with: "12345678"
 fill_in "Password confirmation", with: "12345678"
q1
 within '.new_user' do
  click_on "Sign up"
end
expect(page).to have_content "Welcome! You have signed up successfully."
end

scenario "User doesn't provide required information" do
visit root_path
click_on "Sign up"
within '.new_user' do
  click_on "Sign up"
end
expect(page).to have_content "Email can't be blank"
expect(page).to have_content "Password can't be blank (8 characters minimum)"
expect(page).to have_content "2 errors  prohibited this user form being saved: Email can't be blank"
end

end

