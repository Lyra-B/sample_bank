class Account < ApplicationRecord
  belongs_to :user

  validates :balance, presence: true
  validates :name, presence: true

  def deposit(amount)
    new_balance = balance + amount
    self.update(balance: new_balance)
  end

  def withdraw(amount)
    new_balance = balance - amount
    self.update(balance: new_balance)
  end
end
