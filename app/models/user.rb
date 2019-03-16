class User < ApplicationRecord
  INITIAL_BALANCE = 100

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :account

  after_create :create_account!

  delegate :balance, to: :account

  private

  def create_account!
    Account.create!(user: self, :name => "Main Account", balance: INITIAL_BALANCE)
  end

end
