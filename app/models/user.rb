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

  private

  def create_account!
    Account.create!(user: self, :name => "Main Account", balance: INITIAL_BALANCE)
  end

end
