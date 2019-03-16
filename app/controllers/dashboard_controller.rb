class DashboardController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
    @transaction = Transaction.new
    @receiver_options = User.where.not(id: @user.id).map{|u| [u.email, u.id]}
  end
end