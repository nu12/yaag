require "test_helper"
require "generators/authentication/copy/channels_generator"

require "fileutils"

class CopyChannelsGeneratorTest < Rails::Generators::TestCase
  tests Authentication::Copy::ChannelsGenerator
  destination File.expand_path("../../dummy", File.dirname(__FILE__))

  teardown do
    FileUtils.rm_rf "test/dummy/app/channels/application_cable/connection.rb"
  end

  test "generator creates controllers" do
    run_generator
    assert_file "app/channels/application_cable/connection.rb"
  end
end
