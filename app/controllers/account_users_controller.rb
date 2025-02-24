class AccountUsersController < ApplicationController
  before_action :set_account
  before_action :set_account_user, only: [:edit, :update, :destroy]

  def index
  end

  private

  def set_account
    @account = Account.find_by!(slug: params[:account_slug])
  end

  def set_account_user
    @account_user = @account.account_users.find(params[:id])
  end

  def account_user_params
    params.require(:account_user).permit(:role)
  end

end
