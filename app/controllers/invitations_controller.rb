class InvitationsController < ApplicationController
  include Pagy::Backend
  before_action :set_account
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  layout :set_layout

  def index
    @invitations = @account.invitations.pending

    @pagy, @invitations = pagy(@invitations, items: 12)
  end

  def new
    @invitation = @account.invitations.new
  end

  def create
    @invitation = @account.invitations.new(invitation_params)
  end

  def accept_invitation
  end

  private

  def set_account
    @account = Account.find_by!(slug: params[:account_slug])
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:email)
  end

  def set_layout
    if action_name == "accept_invitation"
      "authentication"
    else
      "application"
    end
  end

end
