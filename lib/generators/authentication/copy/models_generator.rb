module Authentication
  module Copy
    class ModelsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../", __dir__)

      def copy_models
        copy_file "app/models/current.rb"
        copy_file "app/models/session.rb"
        copy_file "app/models/user.rb"
      end
    end
  end
end
