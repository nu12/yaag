require "test_helper"
require "generators/authentication/copy/views_generator"

require "fileutils"

class CopyViewsGeneratorTest < Rails::Generators::TestCase
  tests Authentication::Copy::ViewsGenerator
  destination File.expand_path("../../dummy", File.dirname(__FILE__))

  teardown do
    FileUtils.rm_rf "test/dummy/app/views/sessions"
    FileUtils.rm_rf "test/dummy/app/views/signins"
    FileUtils.rm_rf "test/dummy/app/views/signins_mailer"
  end

  test "generator creates views" do
    run_generator
    assert_file "app/views/sessions/new.html.erb"
    assert_file "app/views/signins/new.html.erb"
    assert_file "app/views/signins_mailer/token.html.erb"
    assert_file "app/views/signins_mailer/token.html.erb"
  end
end
