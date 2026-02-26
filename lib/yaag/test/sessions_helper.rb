module Yaag
  module Test
    module SessionsHelper
      def sign_in_as(user)
        Current.session = user.sessions.create!

        ActionDispatch::TestRequest.create.cookie_jar.tap do |cookie_jar|
          cookie_jar.signed[:session_id] = Current.session.id
          cookies["session_id"] = cookie_jar[:session_id]
        end
      end

      def sign_out
        Current.session&.destroy!
        cookies.delete("session_id")
      end

      alias :sign_in :sign_in_as

      def assert_notice(text)
        follow_redirect!
        assert_select "div", /#{text}/
      end
    end
  end
end
