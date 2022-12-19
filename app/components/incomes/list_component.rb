# frozen_string_literal: true

module Incomes
  class ListComponent < ViewComponent::Base
    def initialize(incomes:)
      @incomes = incomes
    end

  end
end
