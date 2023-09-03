# frozen_string_literal: true

module Incomes
  class ChangeIncome # < Infra::EventHandler
    def call(event)
      @income = Income.find_by(id: event.data.fetch(:id))
      @income.update(
        value: event.data.fetch(:value),
        description: event.data.fetch(:description),
        received_at: event.data.fetch(:received_at),
        user_id: event.data.fetch(:user_id)
      )
    end
  end
end
