require 'rails_helper'

feature 'signing in a user' do
  scenario 'with valid information' do
    user = FactoryGirl.create(:user,
                              email: 'different_email@example.com',
                              password: 'super-safe-password')


    visit new_user_session_path
    fill_in 'Email', with: 'different_email@example.com'
    fill_in 'Password', with: 'super-safe-password'
    click_on 'Log in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with invalid info' do
    visit new_user_session_path
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_on 'Log in'

    expect(page).to have_content("Invalid email or password")
  end
end

