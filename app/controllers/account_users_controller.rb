class AccountUsersController < ApplicationController
  include Pagy::Backend
  before_action :set_account
  before_action :require_admin_role
  before_action :set_account_user, only: [:edit, :update, :destroy]

  def index
    @account_users = @account.account_users.includes(:user)
    @pagy, @account_users = pagy(@account_users, items: 12)
  end
  
  def edit
  end

  def update
    if @account_user.update(account_user_params)
      redirect_to edit_account_member_path(@account, @account_user.id)
    else
      render :edit
    end
  end

  def destroy
    @account_user.destroy
    redirect_to root_path, notice: "Removed from the #{@account.name}"
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

  def require_admin_role
    account_user = current_user.account_users.find_by(account: @account)
  
    unless account_user&.role == "admin"
      flash[:error] = "You don't have permission to manage invitations."
      redirect_to accounts_path
    end
  end

end
