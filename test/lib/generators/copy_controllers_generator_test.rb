require "test_helper"
require "generators/authentication/copy/controllers_generator"

require "fileutils"

class CopyControllersGeneratorTest < Rails::Generators::TestCase
  tests Authentication::Copy::ControllersGenerator
  destination File.expand_path("../../dummy", File.dirname(__FILE__))

  teardown do
    FileUtils.rm_rf "test/dummy/app/controllers/concerns/authentication.rb"
    FileUtils.rm_rf "test/dummy/app/controllers/signins_controller.rb"
    FileUtils.rm_rf "test/dummy/app/controllers/sessions_controller.rb"
  end

  test "generator creates controllers" do
    run_generator
    assert_file "app/controllers/concerns/authentication.rb"
    assert_file "app/controllers/signins_controller.rb"
    assert_file "app/controllers/sessions_controller.rb"
  end
end
