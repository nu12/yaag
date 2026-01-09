class SigninsMailer < ApplicationMailer
  def token(user)
    @user = user
    mail subject: I18n.t("yaag.signins.email_subject"), to: user.email_address
  end
end
