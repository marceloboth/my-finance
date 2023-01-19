# frozen_string_literal: true

require 'rails_helper'

describe 'Create incoming money' do
  before do
    sign_in user
    visit root_path
  end
  
  let(:user) { User.create!(email: 'user@mail.com', password: 'pass123', password_confirmation: 'pass123') }
  
  it 'by navigating to incomes and filling the form' do
    within '#desktop-nav' do
      click_link 'Incomes'
    end

    expect(page).to have_text('Incomes')

    click_link 'New Income'

    fill_in 'Description', with: 'Salary'
    fill_in 'Value', with: 10_000
    fill_in 'Received at', with: '20/01/2022'

    click_button 'Save'

    expect(page).to have_content 'Success'
  end
end
