class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    #make a transaction

    redirect_to dashboard_path
  end
end