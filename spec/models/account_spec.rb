require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:balance) }
  it { should validate_presence_of(:name) }

  describe "#deposit" do
    it "should add the amount to the existing balance" do
      user = FactoryBot.create(:user)
      account = user.account

      account.deposit(20)

      expect(account.balance.to_f).to eq 120
    end

  end

  describe "#withdraw" do
    it "should subtract the amount to the existing balance" do
      user = FactoryBot.create(:user)
      account = user.account

      account.withdraw(20)

      expect(account.balance.to_f).to eq 80
    end
  end
end
