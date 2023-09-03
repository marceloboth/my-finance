# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'infra'
  spec.version = '1.0.0'
  spec.authors = ['Marcelo Both']
  spec.email = ['marcelo.both@gmail.com']

  spec.summary = 'Common package for infrastructure code'
  spec.required_ruby_version = '>= 3.2.0'

  spec.require_paths = ['lib']

  spec.add_dependency 'activejob'
  spec.add_dependency 'aggregate_root', '~> 2.6.0'
  spec.add_dependency 'arkency-command_bus'
  spec.add_dependency 'dry-struct'
  spec.add_dependency 'dry-types'
  spec.add_dependency 'dry-monads'
  spec.add_dependency 'dry-logic'
  spec.add_dependency 'dry-validation'
  spec.add_dependency 'ruby_event_store', '~> 2.6.0'
  spec.add_dependency 'ruby_event_store-transformations'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
