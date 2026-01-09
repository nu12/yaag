class SigninsPreview < ActionMailer::Preview
  def token
    SigninsMailer.token(User.take)
  end
end
