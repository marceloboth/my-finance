# frozen_string_literal: true

require 'rails_helper'

describe 'Create incoming money' do
  it 'by filling incomes form' do
    visit '/incomes/new'

    fill_in 'Value', with: 10_000
    fill_in 'Description', with: 'Salary'

    click_button 'Save'

    expect(page).to have_content 'Success'
  end
end
