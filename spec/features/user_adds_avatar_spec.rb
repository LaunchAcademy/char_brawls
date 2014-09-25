require 'rails_helper'
feature 'user add an avatar', %Q(
  As an user of a site,
  I want to add an avatar
  to show people who I am
) do

  scenario 'user uploads an avatar' do

    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    attach_file 'Profile photo', 'app/assets/images/pitbull_puppy.jpg'
    within '.new_user' do
      click_on "Sign up"
    end
    expect(page).to have_content(user.profile_photo)
  end
end
