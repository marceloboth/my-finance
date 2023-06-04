# frozen_string_literal: true

require 'rails_helper'

# Feature: Account Management
# As a user
# I want to be able to manage my account in the finance system
# So that I can control my personal information and access to the system
describe 'Account Management' do
  scenario 'user registration' do
    visit new_user_registration_path

    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Name', with: 'Example User'
    fill_in 'Individual', with: '123456789'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'user login' do
    visit new_user_session_path

    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Password', with: 'password'

    click_button 'Log in'
  end

  scenario 'forgot password' do
    user = create(:user)

    visit new_user_session_path

    click_link 'Forgot your password?'

    fill_in 'Email', with: user.email

    click_button 'Send me reset password instructions'

    expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
  end

  scenario 'update account information' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    within '#desktop-nav' do
      click_link 'My Account'
    end

    fill_in 'Email', with: 'new.email@mail.com'

    click_button 'Update'

    expect(page).to have_content 'Your account has been updated successfully.'
  end

  scenario 'user logout' do
    user = create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    within '#desktop-nav' do
      click_link 'Log out'
    end

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(page).to have_content 'Sign in to your account'
  end
end
