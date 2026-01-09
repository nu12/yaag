module Authentication
  module Copy
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../", __dir__)

      def copy_views
        copy_file "app/views/sessions/new.html.erb"
        copy_file "app/views/signins/new.html.erb"
        copy_file "app/views/signins_mailer/token.html.erb"
        copy_file "app/views/signins_mailer/token.text.erb"
      end
    end
  end
end
