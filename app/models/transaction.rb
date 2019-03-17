class Transaction < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  before_create :update_balances

  protected

  def update_balances
    sender.withdraw_from_account(amount)
    receiver.deposit_to_account(amount)
  end
end
