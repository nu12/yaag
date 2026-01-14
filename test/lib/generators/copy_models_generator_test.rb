require "test_helper"
require "generators/authentication/copy/models_generator"

require "fileutils"

class CopyModelsGeneratorTest < Rails::Generators::TestCase
  tests Authentication::Copy::ModelsGenerator
  destination File.expand_path("../../dummy", File.dirname(__FILE__))

  teardown do
    FileUtils.rm_rf "test/dummy/app/models/current.rb"
    FileUtils.rm_rf "test/dummy/app/models/session.rb"
    FileUtils.rm_rf "test/dummy/app/models/user.rb"
  end

  test "generator creates controllers" do
    run_generator
    assert_file "app/models/current.rb"
    assert_file "app/models/session.rb"
    assert_file "app/models/user.rb"
  end
end
