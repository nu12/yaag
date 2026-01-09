class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  before_action :set_user_by_token, only: %i[ create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_path, alert: I18n.t("yaag.errors.rate_limit") }

  def new
  end

  def create
    start_new_session_for @user
    redirect_to after_authentication_url
  end

  def destroy
    terminate_session
    redirect_to new_signin_path, notice: I18n.t("yaag.sessions.successful"), status: :see_other
  end
  private
    def set_user_by_token
      @user = User.find_by_email_address_login_token!(params[:token])
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to new_signin_path, alert: I18n.t("yaag.errors.invalid_token"), status: :see_other
    end
end
