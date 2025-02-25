class InvitationMailer < ApplicationMailer
  def invitation_email(invitation)
    @account = invitation.account
    @invitation = invitation
    mail(to: @invitation.email, subject: "Invitation to join #{@invitation.account.name}")
  end

  def invitation_accepted_email(invitation, invitee_user)
    @invitation = invitation
    @invited_user = invitee_user
    recipient_email = @invitation.user.present? ? @invitation.user.email_address : @invitation.account.owner.email_address
    mail(to: recipient_email, subject: "#{invitee_user.name} accepted your invitation")
  end
end
