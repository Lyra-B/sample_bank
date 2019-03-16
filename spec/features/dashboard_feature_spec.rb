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

    visit dashboard_path

    expect(page).to have_content('Account Balance: 100')
  end

  scenario 'a user sends money to another user' do
    receiver = FactoryBot.create(:user, email: "receiver@email.com")
    sender = FactoryBot.create(:user)
    sign_in sender

    visit dashboard_path
    select receiver.email, from: "transaction_receiver_id"
    fill_in "transaction_amount", with: 30
    click_on "Send"

    expect(current_path).to eq(dashboard_path)
    #test if balance is updated here
  end
end