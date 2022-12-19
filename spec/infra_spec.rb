require "rails_helper"

path = Rails.root.join("infra/spec")
Dir.glob("#{path}/**/*_spec.rb") { |file| require file }
