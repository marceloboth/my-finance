# frozen_string_literal: true

module Incoming
  module Commands
    class CreateIncome < Infra::Command
      attribute :value, Infra::Types::Coercible::Float
      attribute :description, Infra::Types::String
      attribute :received_at, Infra::Types::Date
    end
  end
end
