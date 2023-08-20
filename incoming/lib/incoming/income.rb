# frozen_string_literal: true

module Incoming
  class Income
    include AggregateRoot

    def initialize
      @state = :new
    end

    def create(id: , value:, description:, received_at:)
      apply(Events::IncomeCreated.new(data: { id:, value:, description:, received_at: }))
    end

    on Events::IncomeCreated do |_event|
      @state = :created
    end
  end
end
