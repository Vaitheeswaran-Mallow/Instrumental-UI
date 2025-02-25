class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
has_one_attached :avatar

attr_accessor :invite
  has_many :account_users, dependent: :destroy
  has_many :accounts, through: :account_users
  has_many :invitations, dependent: :nullify
  after_create :create_account
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true,format: { with: URI::MailTo::EMAIL_REGEXP }
  def initials
    if first_name?
      first_initial = first_name[0]
      last_initial = last_name[0] if last_name?
      "#{first_initial}#{last_initial}"
    else
      email_address[0].to_s
    end
  end
  def name
    if first_name? && last_name?
      "#{first_name} #{last_name}"
    elsif first_name?
      first_name
    elsif last_name?
      last_name
    else
      email_address
    end
  end
            
  private

            def create_account
              return if self.invite

              account_name = self.email_address.split("@").first
              account = Account.create(name: account_name, owner_id: self.id)
              account_user = AccountUser.create(account: account, user: self, role: 'admin')
            end

end
