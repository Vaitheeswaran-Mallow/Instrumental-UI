class Account < ApplicationRecord
  include SlugGenerator

  belongs_to :owner, class_name: 'User'
  has_many :account_users, dependent: :destroy
  has_many :users, through: :account_users
  has_many :invitations, dependent: :destroy

  before_create :generate_slug

  validates :name, presence: true

  private

  def generate_slug
    generate_random_slug
  end

end
