class Account < ApplicationRecord
  belongs_to :user

  validates :balance, presence: true
  validates :name, presence: true
end
