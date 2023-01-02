# frozen_string_literal: true

require_relative "lib/infra/version"

Gem::Specification.new do |spec|
  spec.name = "infra"
  spec.version = Infra::VERSION
  spec.authors = ["Marcelo Both"]
  spec.email = ["marcelo.both@gmail.com"]

  spec.summary = "Common package for infrastructure code"
  spec.required_ruby_version = ">= 2.6.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-struct"
  spec.add_dependency "dry-types"
  spec.add_dependency "aggregate_root", "~> 2.6.0"
  spec.add_dependency "arkency-command_bus"
  spec.add_dependency "ruby_event_store", "~> 2.6.0"
  spec.add_dependency "ruby_event_store-transformations"
  spec.add_dependency "activejob"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
