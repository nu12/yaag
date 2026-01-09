require "test_helper"

class SessionTest < ActiveSupport::TestCase
  test "methods" do
    session = sessions(:yaag)
    assert session.respond_to? :user
    assert session.respond_to? :ip_address
    assert session.respond_to? :user_agent
  end
end
