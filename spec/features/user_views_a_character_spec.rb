require 'rails_helper'
feature "user wants to see characters", %{
  As an user,
  I want to see a list of characters
}  do

scenario "user can view characters" do
  character1 = FactoryGirl.create(:character)
  character2 = FactoryGirl.create(:character)

  visit '/characters'

  expect(page).to have_content character1.name
  expect(page).to have_content character2.name
end
end
