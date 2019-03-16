require 'rails_helper'

feature 'User signs in' do
  scenario 'with valid email and password' do
    user = FactoryBot.create(:user)

    sign_in user.email, user.password

    expect(page).to have_content('Logout')
    expect(page).to have_content('Dashboard')
    expect(current_path).to eq(dashboard_path)
  end

  scenario 'with invalid credentials' do
    sign_in 'some@random.mail', 'somepassword'

    expect(page).to have_content('Sign up')
    expect(page).to have_content('Login')
  end

  def sign_in(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end