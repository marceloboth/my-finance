require "rails_helper"

path = Rails.root.join("incomes/spec")
Dir.glob("#{path}/**/*_spec.rb") { |file| require file }
