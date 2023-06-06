# frozen_string_literal: true

require 'rails_helper'

# Feature: Account Management
# As a user
# I want to be able to manage my account in the finance system
# So that I can control my personal information and access to the system
describe 'Account Management' do
  context 'when user registration' do
    before do
      visit new_user_registration_path
    end

    it 'will create a new user' do
      fill_in 'Email', with: 'example@gmail.com'
      fill_in 'Name', with: 'Example User'
      fill_in 'Individual', with: '123456789'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_button 'Sign up'

      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end

  context 'when user logs in' do
    before do
      visit new_user_session_path
    end

    let(:user) { create(:user) }

    it 'will authenticate a valid user' do
      log_in(user)

      expect(page).to have_content 'Signed in successfully.'
    end
  end

  context 'when user forgot a password' do
    before do
      visit new_user_session_path
    end

    let(:user) { create(:user) }

    it 'will let user to reset password' do
      click_link 'Forgot your password?'
      fill_in 'Email', with: user.email
      click_button 'Send me reset password instructions'

      expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
    end
  end

  context 'when user updates account information' do
    before do
      visit new_user_session_path
    end

    let(:user) { create(:user) }

    it 'will update user account information' do
      log_in(user)

      within '#desktop-nav' do
        click_link 'My Account'
      end

      fill_in 'Email', with: 'new.email@mail.com'
      fill_in 'Name', with: 'New Name'
      fill_in 'Individual', with: '987654321'
      fill_in 'Current password', with: user.password

      click_button 'Update'

      expect(page).to have_content 'Your account has been updated successfully.'
      expect(user.reload.name).to eq 'New Name'
    end
  end

  context 'when user log out from account' do
    before do
      visit new_user_session_path
    end

    let(:user) { create(:user) }

    it 'will log out the user' do
      log_in(user)

      within '#desktop-nav' do
        click_link 'Log out'
      end

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
      expect(page).to have_content 'Sign in to your account'
    end
  end

  private

  def log_in(user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end
end
