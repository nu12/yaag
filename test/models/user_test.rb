require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "methods" do
    user = users(:yaag)
    assert user.respond_to? :sessions
    assert user.respond_to? :email_address_login_token
    assert user.respond_to? :email_address_login_token_expires_in
    assert User.respond_to? :find_by_email_address_login_token
    assert User.respond_to? :find_by_email_address_login_token!
    assert User.respond_to? :find_or_create_by
  end

  test "downcases and strips email_address" do
    user = User.new(email_address: " DOWNCASED@EXAMPLE.COM ")
    assert_equal("downcased@example.com", user.email_address)
  end
end
