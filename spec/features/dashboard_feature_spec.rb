require 'rails_helper'

feature 'Dashboard' do
  scenario 'a non authenticated user tries to visit the dashboard' do
    visit dashboard_path

    expect(page).to have_content('Login')
    expect(current_path).to eq(new_user_session_path)
  end
end