# frozen_string_literal: true

class Income
  include AggregateRoot

  def initialize
    @state = :new
  end

  def create
    apply IncomeCreated.new(data: { value: 10_000.0, description: 'Salary' })
  end

  on IncomeCreated do |event|
    @state = :created
  end
end
