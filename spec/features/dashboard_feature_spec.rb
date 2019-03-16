require 'rails_helper'

feature 'Dashboard' do
  scenario 'a non authenticated user tries to visit the dashboard' do
    visit dashboard_path

    expect(page).to have_content('Login')
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'a user sees their balance' do
    user = FactoryBot.create(:user)
    sign_in user

    save_and_open_page
    visit dashboard_path


    expect(page).to have_content('Account Balance: 100')
  end
end