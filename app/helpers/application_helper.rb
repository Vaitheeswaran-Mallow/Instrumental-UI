module ApplicationHelper
  include AvatarsHelper

  include FieldsHelper

  def current_user
    Current.user
  end      
        def current_account
          return @current_account if defined?(@current_account)
      
          if cookies[:current_account].present?
            account = Account.find_by(slug: cookies[:current_account])
            if account && account.users.include?(current_user)
              return @current_account = account
            end
          end
      
          # Fallback: User's most recently created account
          @current_account = current_user.accounts.order(created_at: :desc).first
        end
      
      end
