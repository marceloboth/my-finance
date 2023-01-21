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

    fill_new_income('Salary', '20/01/2022', 10_000)
    expect_new_income_content('Salary', '20/01/2022', '10000.0')

    fill_new_income('Freelance', '21/01/2022', 1_000)
    expect_new_income_content('Freelance', '20/01/2022', '1000.0')

    expect(page).to have_content 'Total'
    expect(page).to have_content '$11000.0'
  end

  private

  def fill_new_income(description, received_at, value)
    click_link 'New Income'

    fill_in 'Description', with: description
    fill_in 'Value', with: value
    fill_in 'Received at', with: received_at

    click_button 'Save'

    expect(page).to have_content 'Success'
  end

  def expect_new_income_content(description, received_at, value)
    expect(page).to have_content description
    expect(page).to have_content received_at
    expect(page).to have_content value
  end
end
