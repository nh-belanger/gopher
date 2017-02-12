require 'rails_helper'

feature 'user creates a new group' do

  scenario "member can navigate to the form" do
    member = FactoryGirl.create(:member)
    sign_in member
    visit new_member_group_path(member)
    expect(page).to have_content "Create a Group"
  end

  scenario "member can create a group" do
    member = FactoryGirl.create(:member)
    sign_in member
    visit new_member_group_path(member)
    fill_in "group_name", with: "The Mormon Tabernacle Choir"
    click_button "Create"

    expect(page).to have_content "The Mormon Tabernacle Choir"
  end
end
