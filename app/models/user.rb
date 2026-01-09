class User < ApplicationRecord
  include Yaag::PasswordlessLogin
  has_passwordless_login
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
