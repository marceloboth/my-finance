# frozen_string_literal: true

module Incoming
  module Events
    class IncomeUpdated < Infra::Event
      attribute :id, Infra::Types::UUID
      attribute :value, Infra::Types::Coercible::Float
      attribute :description, Infra::Types::String
      attribute :received_at, Infra::Types::JSON::Date
      attribute :user_id, Infra::Types::ID
    end
  end
end
