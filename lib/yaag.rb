require "yaag/version"
require "yaag/engine"

module Yaag
  module Test
    autoload :SessionsHelper, "yaag/test/sessions_helper"
  end

  module PasswordlessLogin
    extend ActiveSupport::Concern

    DEFAULT_LOGIN_TOKEN_EXPIRES_IN = 15.minutes

    class << self
    end

    module ClassMethods
      def has_passwordless_login(attribute = :email_address)
        include InstanceMethodsOnActivation.new(attribute)

        if respond_to?(:generates_token_for)
          login_token_expires_in = DEFAULT_LOGIN_TOKEN_EXPIRES_IN

          silence_redefinition_of_method(:"#{attribute}_login_token_expires_in")
          define_method(:"#{attribute}_login_token_expires_in") { login_token_expires_in }

          generates_token_for :"#{attribute}_login", expires_in: login_token_expires_in do
            public_send(:"#{attribute}")&.first(10)
          end

          class_eval <<-RUBY, __FILE__, __LINE__ + 1
            silence_redefinition_of_method :find_by_#{attribute}_login_token
            def self.find_by_#{attribute}_login_token(token)
              find_by_token_for(:#{attribute}_login, token)
            end

            silence_redefinition_of_method :find_by_#{attribute}_login_token!
            def self.find_by_#{attribute}_login_token!(token)
              find_by_token_for!(:#{attribute}_login, token)
            end
          RUBY
        end
      end
    end

    class InstanceMethodsOnActivation < Module
      def initialize(attribute)
        # attr_accessor attribute
        define_method("#{attribute}_login_token") do
          generate_token_for(:"#{attribute}_login")
        end
      end
    end
  end
end
