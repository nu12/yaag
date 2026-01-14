module Authentication
  module Copy
    class ChannelsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../", __dir__)

      def copy_channels
        copy_file "app/channels/application_cable/connection.rb"
      end
    end
  end
end
