# frozen_string_literal: true
module Incomes
  class RegisterIncome # < Infra::EventHandler
    def call(event)
      Income.create(
        value: event.data.fetch(:value),
        description: event.data.fetch(:description)
      )
    end
  end
end
