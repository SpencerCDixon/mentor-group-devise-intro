require 'rails_helper'

feature 'user signs up for our app' do
  scenario 'user provides valid information' do
    visit new_user_registration_path

    fill_in 'Email', with: 'someemail@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'user provides invalid information' do
    visit new_user_registration_path

    click_on 'Sign up'

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end
end
