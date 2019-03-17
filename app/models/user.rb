class User < ApplicationRecord
  INITIAL_BALANCE = 100

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :account

  has_many :received_transactions, foreign_key: :receiver_id, class_name: "Transaction"
  has_many :sent_transactions, foreign_key: :sender_id, class_name: "Transaction"

  after_create :create_account!

  delegate :balance, to: :account

  def deposit_to_account(amount)
    account.deposit(amount)
  end

  def withdraw_from_account(amount)
    account.withdraw(amount)
  end

  def transactions
    received_transactions + sent_transactions
  end

  private

  def create_account!
    Account.create!(user: self, :name => "Main Account", balance: INITIAL_BALANCE)
  end

end
