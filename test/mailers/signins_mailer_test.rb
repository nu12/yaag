require "test_helper"

class SigninsMailerTest < ActionMailer::TestCase
  test "token" do
    email = SigninsMailer.token(users(:yaag))

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [ "test@yaag.rails" ], email.to
    assert_equal "Sign in link", email.subject
  end
end
