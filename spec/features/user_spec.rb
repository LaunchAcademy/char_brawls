require 'rails_helper'
feature "Is the member an admin", %Q{
  As a user,
  I should not be able to do admin functions
} do

  scenario 'Is this user an admin?' do
    user = User.new(role: "member")
    expect(user).to_not be_admin
  end


  it 'Is an admin if the role is admin' do
    user = User.new(role: "admin")
    expect(user).to be_admin
  end
end
