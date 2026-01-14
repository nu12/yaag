module Authentication
  module Copy
    class MailersGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../", __dir__)

      def copy_mailers
        copy_file "app/mailers/signins_mailer.rb"
      end
    end
  end
end
