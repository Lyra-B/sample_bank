require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should belong_to(:receiver).class_name('User') }
  it { should belong_to(:sender).class_name('User') }

  describe "callbacks" do
    context "before_create" do

      it "should subtract the amount from the sender's balance" do
        sender = FactoryBot.create(:user)
        receiver = FactoryBot.create(:user, email: "mail@receiver.com")


        Transaction.create!(sender: sender, receiver: receiver, amount: 30)

        expect(sender.balance.to_f).to eq 70
      end

      it "should add the amount to the receiver's balance" do
        sender = FactoryBot.create(:user)
        receiver = FactoryBot.create(:user, email: "mail@receiver.com")

        Transaction.create!(sender: sender, receiver: receiver, amount: 40)

        expect(receiver.balance.to_f).to eq 140
      end
    end
  end
end
