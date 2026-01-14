class User < ApplicationRecord
  include Yaag::PasswordlessLogin
end
