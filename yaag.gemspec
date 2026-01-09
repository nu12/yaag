# frozen_string_literal: true

require_relative "lib/yaag/version"

Gem::Specification.new do |spec|
  spec.name = "yaag"
  spec.version = Yaag::VERSION
  spec.authors = [ "nu12" ]
  spec.email = [ "34694287+nu12@users.noreply.github.com" ]

  spec.summary = "Passwordless authentication for your Ruby on Rails app."
  spec.description = "Yet Another Authentication Gem (YAAG) provides passwordless authentication for your Ruby on Rails app, all it takes is the user's e-mail address."
  spec.homepage = "https://github.com/nu12/yaag"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nu12/yaag"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = [ "lib" ]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
