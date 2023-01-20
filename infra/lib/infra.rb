# frozen_string_literal: true

module Infra
  require 'ruby_event_store'
  require 'aggregate_root'
  require 'arkency/command_bus'
  require 'dry-struct'
  require 'dry-types'
  require 'active_support/notifications'
  require 'minitest'
  require 'ruby_event_store/transformations'
  require 'active_job'

  require_relative 'infra/command'
  require_relative 'infra/types'

  class Error < StandardError; end
  # Your code goes here...
end
