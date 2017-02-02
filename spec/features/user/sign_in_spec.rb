require 'rails_helper'

feature 'Sign in' do
  xscenario 'an existing member specifies a valid email and password' do
    member = FactoryGirl.create(:member)
    visit root_path
    click_link 'Sign In'

    fill_in 'email', with: member.email
    fill_in 'password', with: member.password
    click_button 'Sign In'

    expect(page).to have_content("Gopher")
    expect(page).to have_content("Teetimes")
    expect(page).to_not have_content("Register")
    expect(page).to_not have_content("Sign In")
    click_link 'Sign Out'
    visit root_path
    expect(page).to have_content("Register")
    expect(page).to have_content("Sign In")
    expect(page).to_not have_content("Sign Out")
  end

  xscenario 'a nonexistant email and password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Electronic Mail', with: 'nonbody@gmail.com'
    fill_in 'Password', with: 'wrbdstdaetnat'
    click_button 'Sign In'
    expect(page).to have_content("Invalid Electronic Mail or Password")
    expect(page).to_not have_content("Whassup Dawg! Welcome Back!")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Sign In")
  end

  xscenario 'an existing email and wrong password is denied access' do
    member = FactoryGirl.create(:member)

    visit root_path
    click_link 'Sign In'
    fill_in 'Electronic Mail', with: member.email
    fill_in 'Password', with: 'wrbdstdaetnat'
    click_button 'Sign In'
    expect(page).to have_content("Invalid Electronic Mail or Password")
    expect(page).to_not have_content("Whassup Dawg! Welcome Back!")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Sign In")
  end

  xscenario 'an already authenticated member cannot re-sign in' do
    member = FactoryGirl.create(:member)
    visit new_member_session_path
    fill_in 'Electronic Mail', with: member.email
    fill_in 'Password', with: member.password
    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    expect(page).to have_content("You are already signed in dawg.")
  end


end
