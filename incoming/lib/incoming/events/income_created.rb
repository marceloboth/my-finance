# frozen_string_literal: true

module Incoming
  class IncomeCreated < Infra::Event
    attribute :value, Infra::Types::Coercible::Float
    attribute :description, Infra::Types::String
  end
end
