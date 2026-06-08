# frozen_string_literal: true

module Incoming
  class Income
    include AggregateRoot

    def initialize
      @state = :new
    end

    def create(id: , value:, description:, received_at:, user_id:)
      apply(Events::IncomeCreated.new(data: { id:, value:, description:, received_at:, user_id: }))
    end

    def update(id: , value:, description:, received_at:, user_id:)
      apply(Events::IncomeUpdated.new(data: { id:, value:, description:, received_at:, user_id: }))
    end

    on Events::IncomeCreated do |_event|
      @state = :created
    end

    on Events::IncomeUpdated do |_event|
      @state = :updated
    end
  end
end
