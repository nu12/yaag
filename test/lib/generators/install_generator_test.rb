require "test_helper"
require "generators/authentication/install_generator"

require "fileutils"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Authentication::InstallGenerator
  destination File.expand_path("../../dummy", File.dirname(__FILE__))

  teardown do
    FileUtils.rm_rf "test/dummy/db/migrate"
  end

  test "generator creates migrations" do
    run_generator
    assert !Dir.glob("db/migrate/*_create_users.rb").empty?
    assert !Dir.glob("db/migrate/*_create_sessions.rb").empty?
  end

  test "generator configures application controller" do
    File.open("test/dummy/app/controllers/application_controller.rb", "w") { |f| f.write("class ApplicationController < ActionController::Base\n  allow_browser versions: :modern\nend\n") }
    run_generator
    assert File.read("test/dummy/app/controllers/application_controller.rb").include? "include Authentication"
  end
end
