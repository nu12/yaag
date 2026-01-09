class SigninsController < ApplicationController
  allow_unauthenticated_access
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_signin_path, alert: I18n.t("yaag.errors.rate_limit") }
  def new
  end

  def create
    user = User.find_or_create_by(email_address: params[:email_address])
    SigninsMailer.token(user).deliver_now
    redirect_to new_session_path, notice: I18n.t("yaag.signins.email_sent"), status: :see_other
  end
end
