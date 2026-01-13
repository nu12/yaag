module Authentication
  module Copy
    class ControllersGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../", __dir__)

      def copy_controllers
        copy_file "app/controllers/concerns/authentication.rb"
        copy_file "app/controllers/sessions_controller.rb"
        copy_file "app/controllers/signins_controller.rb"
      end
    end
  end
end
