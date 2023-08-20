# frozen_string_literal: true

module Incoming
  module Services
    class OnCreateMoneyIncome
      def initialize(event_store = Rails.configuration.event_store)
        @repository = AggregateRoot::Repository.new(event_store)
      end

      def call(command)
        @repository.with_aggregate(Income.new, "Income$#{SecureRandom.uuid}") do |income|
          income.create(
            id: command.id,
            value: command.value,
            description: command.description,
            received_at: command.received_at
          )
        end
      end
    end
  end
end
