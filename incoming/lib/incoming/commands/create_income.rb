# frozen_string_literal: true

module Incoming
  class CreateIncome < Infra::Command
    attribute :value, Infra::Types::Coercible::Float
    attribute :description, Infra::Types::String
  end
end
