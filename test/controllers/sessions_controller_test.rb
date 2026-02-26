require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include Yaag::Test::SessionsHelper
  setup { @user = User.take }

  test "new" do
    get new_session_path
    assert_response :success
  end

  test "create with valid token" do
    get create_session_url(token: @user.email_address_login_token)
    assert_response :found
    assert_notice "Signed in successfull"
  end

  test "create with invalid token" do
    get create_session_url(token: "not-valid")
    assert_response :see_other
    assert_notice "Signin link is invalid or has expired"
  end

  test "destroy" do
    sign_in_as(User.take)

    delete session_path

    assert_redirected_to new_signin_path
    assert_empty cookies[:session_id]
  end
end
