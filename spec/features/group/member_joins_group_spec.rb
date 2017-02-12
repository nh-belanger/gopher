require 'rails_helper'

xfeature 'member joins a group' do
  scenario 'member sees created group on index page' do
    member = FactoryGirl.create(:member)
    visit new_member_group_path(member)
    fill_in "group_name", with: "The Mormon Tabernacle Choir"
    click_button "Create"
    visit destroy_member_session_path

    member2 = FactoryGirl.create(:member)
    visit "/members/#{member2.id}/groups/#{Group.last.id}/join"
    visit "/members/#{member2.id}/groups/#{Group.last.id}"
    expect(page).to have_content "#{member2.first_name}"
  end
end
