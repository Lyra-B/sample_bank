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
end
