# frozen_string_literal: true

module Incoming
  class Income
    include AggregateRoot

    def initialize
      @state = :new
    end

    def create(value:, description:)
      apply(Events::IncomeCreated.new(data: { value:, description: }))
    end

    on Events::IncomeCreated do |event|
      @state = :created
    end
  end
end
