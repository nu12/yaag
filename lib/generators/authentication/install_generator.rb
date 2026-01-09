module Authentication
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    def configure_application_controller
      inject_into_class "app/controllers/application_controller.rb", "ApplicationController", "  include Authentication\n"
    end

    def generate_migrations
      generate "migration", "CreateUsers", "email_address:string!:uniq", "--force"
      generate "migration", "CreateSessions", "user:references ip_address:string user_agent:string", "--force"
    end

    def show_readme
      readme "README" if behavior == :invoke
    end
  end
end
