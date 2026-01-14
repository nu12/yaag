require "test_helper"
require "generators/authentication/copy/mailers_generator"

require "fileutils"

class CopyMailersGeneratorTest < Rails::Generators::TestCase
  tests Authentication::Copy::MailersGenerator
  destination File.expand_path("../../dummy", File.dirname(__FILE__))

  teardown do
    FileUtils.rm_rf "test/dummy/app/mailers/signins_mailer.rb"
  end

  test "generator creates controllers" do
    run_generator
    assert_file "app/mailers/signins_mailer.rb"
  end
end
