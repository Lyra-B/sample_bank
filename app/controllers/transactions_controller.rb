class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @transaction = Transaction.new({sender: current_user}.merge(transaction_params))
    if @transaction.save
      redirect_to dashboard_path
    else
      flash[:alert] = @transaction.errors.full_messages
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:receiver_id, :amount)
  end
end