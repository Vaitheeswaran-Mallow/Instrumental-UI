class Invitation < ApplicationRecord
  belongs_to :account
  belongs_to :user, optional: true
  has_rich_text :message

  enum :status, { pending: "pending", accepted: "accepted" }

  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }

  validates :email, presence: true, uniqueness: { scope: :account_id }

  after_create :set_default_message

  def set_default_message
    self.message = "You are invited to join #{account.name}.  Click the link below to accept your invitation."
  end
end
