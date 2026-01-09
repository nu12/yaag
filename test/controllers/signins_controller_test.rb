require "test_helper"

class SigninsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect" do
    get root_url
    assert_redirected_to new_signin_url
    assert_response :found
  end

  test "should get new" do
    get new_signin_url
    assert_response :success
  end

  test "should get create" do
    assert_difference("User.count") do
      post signin_url, params: { email_address: "test@test.com" }
    end

    assert_redirected_to new_session_url
    assert_response :see_other
  end
end
