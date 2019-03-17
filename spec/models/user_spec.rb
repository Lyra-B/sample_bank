require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:account) }

  describe "callbacks" do
    context "after create" do
      it "should create an account for the user" do
        user = FactoryBot.create(:user)

        account = user.account

        expect(account).not_to be_nil
        expect(account.balance).to eq 100
      end
    end
  end

  describe "#deposit_to_account" do
    it "should call deposit on the user's account" do
      user = FactoryBot.create(:user)
      amount = 30
      allow(user.account).to receive :deposit

      user.deposit_to_account(amount)

      expect(user.account).to have_received(:deposit).with(amount)
    end
  end

  describe "#withdraw_from_account" do
    it "should call withdraw on the user's account" do
      user = FactoryBot.create(:user)
      amount = 30
      allow(user.account).to receive :withdraw

      user.withdraw_from_account(amount)

      expect(user.account).to have_received(:withdraw).with(amount)
    end
  end
end
