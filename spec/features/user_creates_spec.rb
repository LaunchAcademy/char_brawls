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
 click_on "Sign up"
 fill_in "Email", with: "abc@example.com"
 fill_in "Password", with: "123456"
 fill_in "Password confirmation", with: "123456"
 within '.new_user' do
  click_on "sign up"
end
expect(page).to have_content "Welcome!You have signed up successfully"
end

scenario



end

